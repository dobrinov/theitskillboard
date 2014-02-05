class My::AvatarsController < My::CommonController

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update_attributes(user_params)
      flash[:notice] = 'Profile picture uploaded.'
    else
      flash[:error] = 'Profile picture upload failed.'
    end

    redirect_to back_or_default(edit_my_profile_path)
  end

  def destroy
    @user = current_user

    @user.avatar = nil

    if @user.save
      flash[:notice] = 'Profile picture deleted.'
    else
      flash[:error] = 'Profile picture deletion failed.'
    end

    redirect_to back_or_default(edit_my_profile_path)
  end

  private

  def user_params
    params.require(:user).permit(:avatar)
  end

end