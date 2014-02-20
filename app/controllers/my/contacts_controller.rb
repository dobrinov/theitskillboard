class My::ContactsController < My::CommonController

  def new
    @contact = Contact.new
  end

  def create
    @contact = current_user.contacts.build(contact_params)

    if current_user.save
      redirect_to back_or_default(edit_my_profile_path), notice: "Contact created."
    else
      flash.now[:error] = "Contact not created."
      render :new
    end
  end

  def edit
    @contact = current_user.contacts.find(params[:id])
  end

  def update
    @contact = current_user.contacts.find(params[:id])

    if @contact.update_attributes(contact_params)
      redirect_to back_or_default(edit_my_profile_path), notice: "Contact updated."
    else
      flash.now[:error] = "Contact not updated."
      render :edit
    end
  end

  def destroy
    @contact = current_user.contacts.find(params[:id])

    if @contact.destroy
      flash[:notice] = "Contact deleted."
    else
      flash[:error] = "Contact not deleted."
    end

    redirect_to back_or_default(edit_my_profile_path)
  end

  private

  def contact_params
    params.require(:contact).permit(:ctype, :address)
  end

end