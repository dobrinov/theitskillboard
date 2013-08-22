class Impact < ActiveRecord::Base
  attr_accessible :description, :from_date, :to_date

  # Associations
  belongs_to :employment
  belongs_to :project

  has_and_belongs_to_many :skills

  def duration_in_days
    (to_date - from_date).to_i
  end
end