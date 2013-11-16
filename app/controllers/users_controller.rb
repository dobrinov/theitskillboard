class UsersController < ApplicationController

  before_action :require_login, only: [:confirmation, :confirm]
  before_action :require_no_login, only: [:new, :create]

  # GET new user
  def new
    @user = User.new
  end

  # POST create user
  def create
    @user = User.new(user_params)

    if @user.save
      login(@user)
      redirect_to confirmation_user_path, notice: 'Check your email and fill in here the code which you received.'
    else
      render :new
    end

  end

  # GET confirmation
  def confirmation
  end

  # POST confirm
  def confirm
    if params[:confirmation_code] == current_user.confirmation_code
      current_user.activate!
      redirect_to root_path, notice: 'Your user has been successfuly activated!'
    else
      flash.now[:error] = 'The entered confirmation code is invalid.'
      render 'confirmation'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end