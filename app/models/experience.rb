class Experience < ActiveRecord::Base
  before_save :unset_to_date, if: :ongoing?

  belongs_to :user

  def unset_to_date
    self.to = nil
  end

  def employment?
    false
  end

  def study?
    false
  end

end