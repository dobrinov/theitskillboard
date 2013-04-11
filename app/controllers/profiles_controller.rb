class ProfilesController < ApplicationController

  before_filter :require_login, only: ['show', 'edit', 'update']

  def show
    @profile = current_user.profile
  end

  def edit
    @profile = current_user.profile

    if params[:section].nil? || !valid_edit_sections.include?(params[:section])
      params[:section] = 'allsections'
    end

  end

  def update
    case params[:section]
    when 'profilepictureandname'
      profilepictureandname
    when 'generalinformation'
      generalinformation
    when 'experience'
      experience
    when 'contacts'
      contacts
    else
      redirect_to edit_profile_path(current_user)
    end
  end

  private

  def valid_edit_sections
    [
      'profilepictureandname',
      'generalinformation',
      'experience',
      'contacts'
    ]
  end

  private

  def profilepictureandname
    if current_user.profile.update_attributes(params[:profile])
      redirect_to edit_profile_path(current_user), notice: 'Profile picture and name updated successfuly.'
    else
      flash.now[:error] = 'Invalid form data'
      render 'edit'
    end
  end

  def generalinformation
    if current_user.profile.update_attributes(params[:profile])
      redirect_to edit_profile_path(current_user), notice: 'Profile general information updated successfuly.'
    else
      flash.now[:error] = 'Invalid form data'
      render 'edit'
    end
  end

  def experience
  end

  def contacts
  end

end