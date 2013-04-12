class Contact < ActiveRecord::Base
  attr_accessible :address, :contact_type

  # Validations

  # Associations
  has_and_belongs_to_many :profiles

  # Class methods
  def self.types
    [
      ['Email',    :email],
      ['Facebook', :facebook],
      ['LinkedIn', :linkedin],
      ['Twitter',  :twitter],
      ['Github',   :github],
      ['Phone',    :phone]
    ]
  end

  # Instance methods

end