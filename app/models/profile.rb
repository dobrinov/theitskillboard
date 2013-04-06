class Profile < ActiveRecord::Base
  attr_accessible :name, :surname

  # Validations

  # Associations
  belongs_to :user
end