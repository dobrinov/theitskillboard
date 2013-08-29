class Profile::ProfileController < Profile::CommonController

  def show
    @skills = current_user.skills
  end

  def edit
    @skills = current_user.skills
  end

  def profile_picture_and_name
  end

  def location_nationality_and_age
  end

  def update
    if current_user.profile.update_attributes(params[:profile])
      redirect_to profile_edit_path, notice: 'Profile updated successfuly.'
    else
      redirect_to profile_edit_path, error: 'Profile not updated successfuly.'
    end
  end

end