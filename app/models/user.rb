class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation

  has_secure_password

  # TODO: Validate password restrictions
  # TODO: Validate emails

  # Validations
  validates_presence_of :password, :on => :create

  # Associations
  has_many :employments
  has_many :companies, :through => :employments

  has_many :studies
  has_many :universities, :through => :studies

  has_many :projects
end