class MessagesController < ApplicationController

  def new
    @message = Message.new

    @receiver = User.find(params[:profile_id])
    @sender = current_user

    @title = "New message"
  end

  def create
    redirect_to profile_path(params[:message][:receiver_id])
  end

end