class University < ActiveRecord::Base
  attr_accessible :name, :website

  # Associations
  has_many :studies
  has_many :profiles, :through => :studies

  # Validations
  validates :website, :presence => true, :uniqueness => true
end