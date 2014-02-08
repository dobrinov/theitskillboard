class My::ProfilesController < My::CommonController

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update_attributes(user_params)
      flash.now[:notice] = "Profile updated."
    else
      flash.now[:notice] = "Failed to update profile."
    end

    render :edit
  end

  private

  def user_params
    params.require(:user).permit(:name, :surname, :definition,
                                 :birth_date, :gender,
                                 :country, :city, :nationality)
  end

end