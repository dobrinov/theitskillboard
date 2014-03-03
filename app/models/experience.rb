class Experience < ActiveRecord::Base
  before_save :unset_to_date, if: :ongoing?

  # Associations
  belongs_to :user

  # Validations
  validates :at,
            :presence => true

  validates :from,
            :presence => true

  validates :to,
            :presence => true, unless: :ongoing?

  validates :type,
            :presence => true

  def unset_to_date
    self.to = nil
  end

  def to
    self.ongoing ? Date.today : super
  end

  def bar
    return self.original_bar || Bar.last
  end

  def employment?
    false
  end

  def study?
    false
  end

end