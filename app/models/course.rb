class Course < ActiveRecord::Base
  attr_accessible :name, :from_date, :to_date

  # Associations
  belongs_to              :study
  has_many                :projects

  has_and_belongs_to_many :skills
end