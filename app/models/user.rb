class User < ActiveRecord::Base
  has_secure_password

  # Validations
  validates :email,    presence: true, uniqueness: true
  validates :password, presence: true, :on => :create

  # Callbacks
  before_create do
    self.confirmation_code= (0...4).map { (65 + rand(26)).chr }.join # Random 4 digit code
  end

  # States
  state_machine :state, :initial => :awaiting_confirmation do

    state :awaiting_confirmation
    state :confirmed
    state :active

    event :confirm do
      transition [:awaiting_confirmation] => :confirmed
    end

    event :activate do
      transition [:awaiting_confirmation, :confirmed] => :active
    end

  end

  # Class methods
  # Instance methods

end