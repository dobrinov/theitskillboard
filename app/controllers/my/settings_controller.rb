class My::SettingsController < My::CommonController

  def show
    @user = current_user
    @Title = "Settings"
  end

  def update
    redirect_to my_settings_path
  end

end