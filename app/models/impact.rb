class Impact < ActiveRecord::Base
  attr_accessible :description, :from, :to

  # Associations
  belongs_to :company
  belongs_to :project
  has_and_belongs_to_many :skills
end
