class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation

  has_secure_password

  # Associations
  has_one  :profile

  # Validations
  validates :email,
              :presence => true,
              :uniqueness => true,
              :format     => { 
                :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/,
                :message => "Enter valid email"
              }

  validates :password,
              :confirmation => true,
              :length       => { :in => 6..20 },
              :on           => :create

  validates :password_confirmation,
              :presence => true,
              :on       => :create

  def employments
    self.profile.employments.to_a
  end

  def companies
    self.profile.employments.includes(:company).collect_concat { |e| e.company }
  end

  def impacts # TODO: Optimize queries
    employments = self.profile.employments.includes(company:[projects:[:impacts]])
    projects    = employments.collect_concat { |e| e.company.projects }

    employments.collect_concat { |e| e.impacts } + projects.collect_concat { |p| p.impacts }
  end

  def projects # TODO: Optimize queries
    employments = self.profile.employments.includes(company:[:projects])
    courses     = self.profile.studies.includes(:courses).collect_concat { |s| s.courses }

    employments.collect_concat { |e| e.company.projects } + courses.collect_concat { |c| c.project }
  end

  def studies
    self.profile.studies.to_a
  end

  def courses
    self.studies.collect_concat { |s| s.courses }
  end

  def universities
    self.profile.studies.includes(:university).collect_concat { |s| s.university }
  end

  def skills
    (theoretically_developed_skills + professionally_developed_skills).uniq { |skill| skill.id }
  end

  def theoretically_developed_skills
    Skill.joins(courses:[:study]).select('studies.profile_id, skills.*').where('studies.profile_id' => self.profile.id)
  end

  def professionally_developed_skills
    skills = []

    skills.concat(Skill.joins(impacts:[:employment]).where('employments.profile_id' => self.profile.id))
    skills.concat(Skill.joins(impacts:[project:[company:[:employments]]]).where('employments.profile_id' => self.profile.id))

    skills
  end

  def courseworks_for_skill(skill)
    Project.joins(course:[:study, :skills]).where('studies.profile_id' => self.profile.id, 'skills.id' => skill.id).uniq { |project| project.id }
  end

  def experience_in_days_for(skill)
    professional_experience_in_days_for(skill) + theoretical_experience_in_days_for(skill)
  end

  def theoretical_experience_in_days_for(skill)
    courses = Course.joins(:skills, :study).where('studies.profile_id' => self.profile.id, 'skills.id' => skill.id)

    courses.map(&:duration_in_days).inject(0, &:+) # days
  end

  def professional_experience_in_days_for(skill)
    impacts = []
    impacts.concat(Impact.joins(:skills, project:[company:[:employments]]).select("skills.id, employments.profile_id, impacts.id, impacts.from_date as from_date, impacts.to_date as to_date").where('employments.profile_id' => self.profile.id, 'skills.id' => skill.id))
    impacts.concat(Impact.joins(:skills, :employment)                     .select('skills.id, employments.profile_id, impacts.id, impacts.from_date, impacts.to_date')                        .where('employments.profile_id' => self.profile.id, 'skills.id' => skill.id))

    impacts.map(&:duration_in_days).inject(0, &:+) # days
  end

end