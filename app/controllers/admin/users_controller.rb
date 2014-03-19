class Admin::UsersController < Admin::CommonController

  def index
    @users = User.all.order(last_login_at: :desc)
  end

end