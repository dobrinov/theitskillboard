class Profile < ActiveRecord::Base
  attr_accessible :name, :surname, :profile_picture,
                  :birth_date, :country, :city, :nationality

  accepts_nested_attributes_for :interests

  has_attached_file :profile_picture,
                    :styles => {
                      :small => '100x100>',
                      :thumb => '50x50>'
                    }, :default_url => '/assets/placeholders/profile_picture/:style/placeholder.png'

  # Validations
  validates :name,    :presence => true
  validates :surname, :presence => true

  #TODO: Add validations for birth_date, country, city and nationality

  # Associations
  has_and_belongs_to_many :interests

  # Class methods

  # Instance methods
  def full_name
    return "#{self.name} #{self.surname}"
  end

  def general_information_added?
    return [
      self.birth_date.present?,
      self.country.present?,
      self.city.present?,
      self.nationality.present?
    ].any?
  end
end