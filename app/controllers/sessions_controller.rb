class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    
    if user && user.authenticate(params[:password])
      session[:current_user_id] = user.id
      redirect_to profile_path(user), notice: 'Signed in!'
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