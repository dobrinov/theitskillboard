class MessagesController < ApplicationController

  def new
    @message = Message.new

    @receiver = User.find(params[:profile_id])
    @sender = current_user

    if @sender.present? && (@sender.name || @sender.surname)
      @message.sender_name  = "#{@sender.name} #{@sender.surname}"
      @message.sender_email = @sender.email 
    end

    @title = "New message"
  end

  def create
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
      redirect_to profile_path(@receiver.id), notice: 'Message sent.'
    else
      flash.now[:error] = 'You must fill all required fields.'
      render :new
    end

  end

  private

  def message_params
    params.require(:message).permit(:sender_name, :sender_email, :subject, :body)
  end

end