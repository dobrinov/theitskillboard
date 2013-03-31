class University < ActiveRecord::Base
  attr_accessible :name

  # Associations
  has_many :studies
  has_many :users, :through => :studies
end