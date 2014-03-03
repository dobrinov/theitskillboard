class SkillCategory < ActiveRecord::Base

  # Associations
  belongs_to :user
  belongs_to :parent_category, class_name: "SkillCategory", foreign_key: 'parent_skill_category_id'
  has_many   :sub_categories,  class_name: "SkillCategory", foreign_key: 'parent_skill_category_id' , dependent: :destroy
  has_many   :skills, dependent: :destroy

  # Validations
  validates :user,
            :presence => true

  validates :name,
            :presence => true
end