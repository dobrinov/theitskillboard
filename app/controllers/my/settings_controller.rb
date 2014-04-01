class My::SettingsController < My::CommonController

  def show
  end

  def update
    redirect_to my_settings_path
  end

end