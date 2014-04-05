class Message < ActiveRecord::Base

  # Associations
  belongs_to :sender,   class_name: "User", foreign_key: 'sender_id'
  belongs_to :receiver, class_name: "User", foreign_key: 'receiver_id'

  # Validations
  validates :sender_email,
              :presence   => true,
              :format     => {
                :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/,
                :message => "Enter valid email"
              }

  validates :sender_name, presence: true
  validates :subject, presence: true
  validates :body, presence: true

end