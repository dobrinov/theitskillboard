class SkillUsage < ActiveRecord::Base
  attr_accessible :skill_id, :target_id

  belongs_to :skill

  belongs_to :project
  belongs_to :course
end