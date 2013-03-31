class Skill < ActiveRecord::Base
  attr_accessible :name

  # Associations
  belongs_to :category,
             :class_name  => 'SkillCategory',
             :foreign_key => 'skill_category_id'

  has_many :skill_usages
  has_many :projects, :through => :skill_usages
  has_many :courses,  :through => :skill_usages
end