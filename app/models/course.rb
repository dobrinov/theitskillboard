class Course < ActiveRecord::Base
  attr_accessible :name, :from_date, :to_date

  # Associations
  belongs_to  :study
  has_one     :project

  has_and_belongs_to_many :skills

  def duration_in_days
    (to_date - from_date).to_i
  end
end