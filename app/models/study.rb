class Study < ActiveRecord::Base
  attr_accessible :program, :from_date, :to_date, :university_attributes

  # Associations
  belongs_to :profile
  belongs_to :university
end