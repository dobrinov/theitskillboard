class Company < ActiveRecord::Base
  attr_accessible :name

  # Associations
  has_many :employments
  has_many :users, :through => :employments

  has_many :projects
end