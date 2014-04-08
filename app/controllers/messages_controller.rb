class MessagesController < ApplicationController

  before_action :prevent_self_messaging

  def new
    @title = "New message"

    @message = Message.new

    @receiver = User.find(params[:profile_id])
    @sender = current_user

    if @sender.present? && (@sender.name || @sender.surname)
      @message.sender_name  = "#{@sender.name} #{@sender.surname}"
      @message.sender_email = @sender.email 
    end
  end

  def create
    @title = "New message"

    @receiver = User.find(params[:profile_id])
    @sender = current_user

    @message = Message.new(message_params)
    @message.sender = @sender
    @message.receiver = @receiver

    # Overwrite the sender data if sent by logged user
    if @sender.present? && (@sender.name || @sender.surname)
      @message.sender_name  = "#{@sender.name} #{@sender.surname}"
      @message.sender_email = @sender.email
    end

    if @message.save
      NotificationsMailer.message_notification(@message).deliver
      redirect_to profile_path(@receiver.id), notice: 'Message sent.'
    else
      flash.now[:error] = 'The message was not sent. Fix the validation errors!'
      render :new
    end

  end

  private

  def message_params
    params.require(:message).permit(:sender_name, :sender_email, :subject, :body)
  end

  def prevent_self_messaging
    if logged_in? && (current_user.id == params[:profile_id].to_i)
      redirect_to back_or_default(my_profile_path), alert: 'You cannot send a message to your self.'
    end
  end

end