class Course < ActiveRecord::Base
  attr_accessible :name

  # Associations
  has_many :projects
  has_many :skills
end