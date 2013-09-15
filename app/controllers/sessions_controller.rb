class SessionsController < ApplicationController

  before_filter :require_authenticated,     only:   ['destroy']
  before_filter :require_not_authenticated, except: ['destroy']

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    
    if user && user.authenticate(params[:password])
      session[:current_user_id] = user.id
      redirect_to profile_root_path, notice: 'Signed in!'
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