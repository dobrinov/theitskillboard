class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation

  has_secure_password

  # Associations
  has_one  :profile

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
              :length       => { :in => 6..20 },
              :on           => :create

  validates :password_confirmation,
              :presence => true,
              :on       => :create

  def employments
    self.profile.employments.to_a
  end

  def companies
    self.profile.employments.includes(:company).collect_concat { |e| e.company }
  end

  def impacts
    self.profile.employments.includes(:impacts).collect_concat { |e| e.impacts }
  end

  def projects
    self.profile.employments.includes(company: :projects).collect_concat { |e| e.company.projects }
  end

  def studies
    #TODO
  end

  def universities
    #TODO
  end

  def skills
    #TODO
  end

end