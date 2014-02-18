class Experience < ActiveRecord::Base
  belongs_to :user

  before_save :unset_to_date, if: :ongoing?

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