class Skill < ActiveRecord::Base

  # Associations
  belongs_to :user
  belongs_to :skill_category

  # Validations
  validates :user,
            :presence => true

  validates :skill_category,
            :presence => true

  validates :name,
            :presence => true
end