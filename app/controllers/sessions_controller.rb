class SessionsController < ApplicationController

  before_action :require_login, only: [:destroy]
  before_action :require_no_login, only: [:create]

  def create
    user = User.find_by_email(params[:email])
    
    if user && user.authenticate(params[:password])
      login(user)
      redirect_to root_path, notice: 'Signed in!'
    else
      flash.now[:error] = 'Invalid email or password'
      render 'new'
    end
  end

  def destroy
    @_current_user = session[:current_user_id] = nil
    redirect_to root_path, notice: 'Signed out!'
  end

end