class Company < ActiveRecord::Base
  attr_accessible :name

  # Associations
  has_many :positions
  has_many :users, :through => :positions

  has_many :projects
end