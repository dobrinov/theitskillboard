class User < ActiveRecord::Base

  # Associations
  has_many :skill_categories, dependent: :destroy
  has_many :skills, dependent: :destroy

  has_many :experiences, dependent: :destroy
  has_many :employments, dependent: :destroy
  has_many :studies, dependent: :destroy

  has_many :messages, foreign_key: 'receiver_id', dependent: :destroy

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

  has_secure_password

  # Avatar Paperclip configuration
  has_attached_file :avatar,
                    styles: { small: "100x100#", thumb: "50x50#" },
                    default_url: 'placeholders/profile_picture/:style.png'
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def self.demo_sample
    r = joins(:skills).where("users.name IS NOT NULL AND users.surname IS NOT NULL AND users.avatar_file_name IS NOT NULL").group("users.id").having("count(skills.id) > 4")
    r.limit(1).offset(rand(r.size.size)).first
  end

  def unread_message_count
    self.messages.where(read_at: nil).count
  end

  def age
    ((DateTime.now - self.birth_date) / 365.25).to_i
  end

  def seed_initial_skill_tree
    # Root skill categories
    it_skills_category       = self.skill_categories.build({name: 'IT skills'})
    language_skills_category = self.skill_categories.build({name: 'Language skills'})

    # Sub skill categories
    programming_category = self.skill_categories.build({name: 'Programming'})
    frameworks_category  = self.skill_categories.build({name: 'Frameworks'})
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

end