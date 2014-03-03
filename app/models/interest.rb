class Interest < ActiveRecord::Base

  # Associations
  belongs_to :user

  # Validations
  validates :name,
            :presence => true

  validates :user,
            :presence => true
end