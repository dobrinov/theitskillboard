class Course < ActiveRecord::Base
  attr_accessible :name

  # Associations
  has_many :projects
  has_many :skills

  has_and_belongs_to_many :skills
end