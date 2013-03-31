class Position < ActiveRecord::Base
  attr_accessible :name

  # Associations
  belongs_to :user
  belongs_to :company
end