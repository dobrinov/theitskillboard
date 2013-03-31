class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation

  has_secure_password

  # TODO: Validate password restrictions
  # TODO: Validate emails

  validates_presence_of :password, :on => :create
end
