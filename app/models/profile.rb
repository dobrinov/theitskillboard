class Profile < ActiveRecord::Base
  attr_accessible :name, :surname, :profile_picture

  has_attached_file :profile_picture,
                    :styles => {
                      :small => "100x100>",
                      :thumb => "50x50>"
                    }, :default_url => "/assets/placeholders/profile_picture/:style/placeholder.png"

  # Validations
  validates :name,    :presence => true
  validates :surname, :presence => true

  # Associations
  belongs_to :user
end