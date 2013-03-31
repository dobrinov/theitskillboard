class SkillCategory < ActiveRecord::Base
  attr_accessible :name

  has_many :skills, :dependent => :destroy
end
