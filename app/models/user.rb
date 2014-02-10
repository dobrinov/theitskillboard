class User < ActiveRecord::Base
  has_secure_password

  # Associations
  has_many :skill_categories, dependent: :destroy

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

end