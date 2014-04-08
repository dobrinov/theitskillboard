class SessionsController < ApplicationController

  layout 'landingpage'

  before_action :require_login,    only: [:destroy]
  before_action :require_no_login, only: [:new, :create]
  before_action :set_meta_data

  def new
  end

  def create
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      login!(user)
      redirect_to back_or_default(my_root_path), notice: 'Signed in!'
    else
      flash.now[:error] = 'Invalid email or password'
      render 'new'
    end
  end

  def destroy
    logout!(current_user)
    redirect_to new_session_path, notice: 'Signed out!'
  end

  private

  def set_meta_data
    case params[:action]
    when 'new'
      @title = "Log in"
    when 'create'
      @title = "Log in"
    when 'destroy'
      @title = "Log in"
    end
  end

end