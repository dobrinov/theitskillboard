class Course < ActiveRecord::Base
  attr_accessible :name

  # Associations
  has_many :projects
  has_many :skills

  has_many :skill_usages
  has_many :skills, :through => :skill_usages
end