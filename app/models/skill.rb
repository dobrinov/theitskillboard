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

  validates :level,
            :numericality => { 
              :only_integer => true,
              :greater_than_or_equal_to => 0,
              :less_than_or_equal_to => 10
            },
            :presence => true
end