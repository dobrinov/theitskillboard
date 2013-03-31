class Study < ActiveRecord::Base
  attr_accessible :program, :from_date, :to_date

  # Associations
  belongs_to :user
  belongs_to :university
end