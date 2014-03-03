class User < ActiveRecord::Base
  has_secure_password

  # Associations
  has_many :skill_categories, dependent: :destroy
  has_many :skills, dependent: :destroy

  has_many :experiences, dependent: :destroy
  has_many :employments, dependent: :destroy
  has_many :studies, dependent: :destroy

  has_many :interests, dependent: :destroy
  has_many :contacts, dependent: :destroy

  # Validations
  validates :email,
              :presence   => true,
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

  # Avatar Paperclip configuration
  has_attached_file :avatar,
                    styles: { small: "100x100#", thumb: "50x50#" },
                    default_url: 'placeholders/profile_picture/:style.png'
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def age
    ((DateTime.now - self.birth_date) / 365.25).to_i
  end

  def seed_initial_skill_tree
    # Root skill categories
    it_skills_category       = self.skill_categories.build({name: 'IT skills'})
    language_skills_category = self.skill_categories.build({name: 'Language skills'})

    # Sub skill categories
    programming_category = self.skill_categories.build({name: 'Programming'})
    frameworks_category  = self.skill_categories.build({name: 'Framewors'})
    db_category          = self.skill_categories.build({name: 'Databases'})
    os_category          = self.skill_categories.build({name: 'Operating systems'})

    it_skills_category.sub_categories << programming_category
    it_skills_category.sub_categories << frameworks_category
    it_skills_category.sub_categories << db_category
    it_skills_category.sub_categories << os_category

    english_category = self.skill_categories.build({name: 'English'})

    language_skills_category.sub_categories << english_category

    # Skills
    english_speaking_skill      = self.skills.build({name: 'Speaking', level: 5})
    english_writting_skill      = self.skills.build({name: 'Writing', level: 5})
    english_understanding_skill = self.skills.build({name: 'Understanding', level: 5})

    english_category.skills << english_speaking_skill
    english_category.skills << english_writting_skill
    english_category.skills << english_understanding_skill
  end

  def seed_initial_interests
    self.interests.build({name: 'Programming'})
  end

  def seed_initial_contacts
    self.contacts.build({ctype: 'email', address: self.email})
  end

end