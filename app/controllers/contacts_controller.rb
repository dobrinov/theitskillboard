class ContactsController < ApplicationController

  before_filter :require_login

  def index
    @profile  = current_user.profile
    @contacts = current_user.profile.contacts 
    @contact  = Contact.new
  end

  def create
    @profile = current_user.profile
    @contact = Contact.new params[:contact]

    @profile.contacts << @contact

    if @profile.save
      flash[:notice] = 'Contact successfuly added'
    else
      flash[:error] = 'Contact was not added'
    end

    redirect_to profile_contacts_path(@profile.id)
  end

  def destroy
    @profile = current_user.profile

    if Contact.find(params[:contact][:id]).destroy
      flash[:notice] = "Contact removed successfuly"
    else
      flash[:error] = "Contact not removed"
    end

    redirect_to profile_contacts_path(@profile.id)    
  end

end