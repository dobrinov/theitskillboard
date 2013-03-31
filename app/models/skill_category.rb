class SkillCategory < ActiveRecord::Base
  attr_accessible :name

  # Associations
  has_many :skills, :dependent => :destroy
end
