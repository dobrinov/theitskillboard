class Contact < ActiveRecord::Base

  # Associations
  belongs_to :user

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

  validates :address,
            :presence => true

  validates :ctype,
            :presence  => true,
            :inclusion => { :in => types.collect { |type| type.second.to_s } }

end