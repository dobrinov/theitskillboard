class UsersController < ApplicationController

  before_filter :require_not_authenticated

  def new
    @user = User.new
  end

  def create
    @user = User.new params[:user]

    if @user.save

      @user.profile = Profile.create name: 'Your', surname: 'Name'

      redirect_to profile_path(@user), notice: 'Confirmation email sent. Please, check your email!'
    else
      flash.now[:error] = 'Invalid form data'
      render :action => 'new'
    end
  end

end