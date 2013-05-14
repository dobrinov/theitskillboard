class Employment < ActiveRecord::Base
  attr_accessible :position, :from_date, :to_date

  # Associations
  belongs_to :profile
  belongs_to :company
end