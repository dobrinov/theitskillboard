class Experience < ActiveRecord::Base
  belongs_to :user

  def employment?
    false
  end

  def study?
    false
  end

end