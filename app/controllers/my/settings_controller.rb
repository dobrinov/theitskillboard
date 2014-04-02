class My::SettingsController < My::CommonController

  def show
    @user = current_user
    @title = "Settings"
  end

  def update
    redirect_to my_settings_path
  end

end