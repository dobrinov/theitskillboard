class My::ProfilesController < My::CommonController

  def show
    @user = current_user
  end

end