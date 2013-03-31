class Project < ActiveRecord::Base
  attr_accessible :name

  # Associations
  belogns_to :course
  belogns_to :user
  belogns_to :company

  has_many :skills
end