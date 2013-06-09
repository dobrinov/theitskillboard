class Contact < ActiveRecord::Base
  attr_accessible :address, :contact_type

  # Associations
  belongs_to :profile

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

  # Validations
  validates :profile,
              :presence => true

  validates :address,
              :presence => true

  validates :contact_type,
              :presence  => true,
              :inclusion => { :in => types.collect { |type| type.second.to_s } }

  # Instance methods

end