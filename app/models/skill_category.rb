class SkillCategory < ActiveRecord::Base
  attr_accessible :name

  # Associations
  has_many :skills, :dependent => :destroy

  belongs_to :parent_category, :class_name => "SkillCategory", :foreign_key => 'parent_skill_category_id'
  has_many   :sub_categories,  :class_name => "SkillCategory", :foreign_key => 'parent_skill_category_id'
end