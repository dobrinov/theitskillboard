class UsersController < ApplicationController

  layout 'landingpage'

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    @user.seed_initial_skill_tree
    @user.seed_initial_interests
    @user.seed_initial_contacts

    if @user.save
      login(@user)
      redirect_to my_root_path, notice: 'User successfully created!'
    else
      flash.now[:error] = 'Please, fix the validation errors!'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end