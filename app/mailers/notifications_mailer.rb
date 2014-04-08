class NotificationsMailer < ActionMailer::Base
  layout 'email'
  default from: '"The IT skill board" <notifications@theitskillboard.com>'

  def message_notification(message)
    @user = message.receiver
    @message = message

    attachments.inline['logo.png'] = File.read("#{Rails.root}/app/assets/images/logo.png")

    mail(
      to: @user.email,
      subject: "You have just received a message from #{@message.sender_name}"
    )
  end

end