class Study < ActiveRecord::Base

  # Associations
  belongs_to :user
  belongs_to :university
end