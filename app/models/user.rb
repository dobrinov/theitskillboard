class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation

  has_secure_password

  # Validations

  validates :email,
              :presence => true,
              :uniqueness => true,
              :format     => { 
                :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/,
                :message => "Enter valid email"
              }

  validates :password,
              :confirmation => true,
              :length       => { :in => 6..20 }

  validates :password_confirmation,
              :presence => true

  # Associations
  has_one  :profile
  has_many :employments
  has_many :companies, :through => :employments

  has_many :studies
  has_many :universities, :through => :studies

  has_many :projects
end