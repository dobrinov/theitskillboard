class Project < ActiveRecord::Base
  attr_accessible :name

  # Associations
  belongs_to :course
  belongs_to :user
  belongs_to :company

  has_and_belongs_to_many :skills
end