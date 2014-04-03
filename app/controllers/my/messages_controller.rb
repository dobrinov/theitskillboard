class My::MessagesController < My::CommonController

  def index
    @messages = Message.where(receiver_id: current_user.id)
    @title = "Messages"
  end

  def destroy
    redirect_to my_messages_path
  end

end