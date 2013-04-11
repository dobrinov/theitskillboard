class Profile < ActiveRecord::Base
  attr_accessible :name, :surname, :profile_picture,
                  :birth_date, :country, :city, :nationality

  has_attached_file :profile_picture,
                    :styles => {
                      :small => "100x100>",
                      :thumb => "50x50>"
                    }, :default_url => "/assets/placeholders/profile_picture/:style/placeholder.png"

  # Validations
  validates :name,    :presence => true
  validates :surname, :presence => true

  #TODO: Add validations for birth_date, country, city and nationality

  # Associations
  belongs_to :user
end