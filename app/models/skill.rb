class Skill < ActiveRecord::Base
  attr_accessible :name

  # Associations
  belongs_to :category,
             :class_name  => 'SkillCategory',
             :foreign_key => 'skill_category_id'

  
  has_and_belongs_to_many :impacts
  has_and_belongs_to_many :courses
end