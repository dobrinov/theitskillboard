class SkillCategory < ActiveRecord::Base
  belongs_to :user
  belongs_to :parent_category, class_name: "SkillCategory", foreign_key: 'parent_skill_category_id'
  has_many   :sub_categories,  class_name: "SkillCategory", foreign_key: 'parent_skill_category_id' , dependent: :destroy
end