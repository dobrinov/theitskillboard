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
    self.impacts.collect_concat { |i| i.skills } + self.courses.collect_concat { |i| i.skills }
  end

end