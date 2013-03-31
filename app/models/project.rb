class Project < ActiveRecord::Base
  attr_accessible :name

  # Associations
  belongs_to :course
  belongs_to :user
  belongs_to :company

  has_many :skill_usages
  has_many :skills, :through => :skill_usages
end