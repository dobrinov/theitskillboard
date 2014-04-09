class My::MessagesController < My::CommonController

  before_action :set_meta_data

  def index
    @messages = Message.where(receiver_id: current_user.id)
  end

  def show
    @message = current_user.messages.find(params[:id])
    @message.update_attributes(read_at: Time.now)
    @title   = "Message from #{@message.sender_name}"
  end

  def destroy
    @message = current_user.messages.find(params[:id])
    @message.destroy

    redirect_to my_messages_path, notice: 'Message deleted.'
  end


  private

  def set_meta_data
    case params[:action]
    when 'index'
      @title = "Messages"
    when 'show'
      # Will be set within action
    when 'destroy'
      @title = "Messages"
    end
  end

end