class University < ActiveRecord::Base
  attr_accessible :name

  # Associations
  has_many :university_programs
  has_many :users, :through => :university_programs
end