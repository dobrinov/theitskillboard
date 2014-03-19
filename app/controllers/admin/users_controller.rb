class Admin::UsersController < Admin::CommonController

  def index
    @users = User.all.order(updated_at: :desc)
  end

end