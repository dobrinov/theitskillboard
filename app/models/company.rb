class Company < ActiveRecord::Base
  attr_accessible :name

  # Associations
  has_many :users, :through => :position
end