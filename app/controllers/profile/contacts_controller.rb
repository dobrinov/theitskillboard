class Profile::ContactsController < Profile::CommonController

  def index
    @contacts = current_user.profile.contacts
    @contact  = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])

    if current_user.profile.contacts << @contact
      flash[:notice] = 'Contact added successfuly.'
    else
      flash[:error] = 'Contact was not added.'
    end

    redirect_to profile_contacts_path
  end

  def destroy
    @contact = current_user.profile.contacts.find(params[:id])

    if @contact.destroy
      flash[:notice] = "Contact removed successfuly."
    else
      flash[:error] = "Contact was not removed."
    end

    redirect_to profile_contacts_path
  end

end