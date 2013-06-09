class Project < ActiveRecord::Base
  attr_accessible :name, :description, :website

  # Associations
  belongs_to :course
  belongs_to :company

  has_many :impacts
end