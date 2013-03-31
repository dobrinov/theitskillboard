class Skill < ActiveRecord::Base
  attr_accessible :name

  belongs_to :category,
             :class_name  => 'SkillCategory',
             :foreign_key => 'skill_category_id'
end
