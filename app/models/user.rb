class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation

  has_secure_password

  # TODO: Validate password restrictions
  # TODO: Validate emails

  # Validations
  validates_presence_of :password, :on => :create

  # Associations
  has_many :positions
  has_many :companies, :through => :positions

  has_many :university_programs
  has_many :universities, :through => :university_programs
end