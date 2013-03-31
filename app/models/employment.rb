class Employment < ActiveRecord::Base

  # Associations
  belongs_to :user
  belongs_to :company
end