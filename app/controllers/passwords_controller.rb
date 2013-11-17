class PasswordsController < ApplicationController

  # GET forgotten
  def forgotten
  end

  # POST send_email_change
  def send_email_change
    user = User.find_by_email(params[:email])

    if user.present?
      if true # send_password_change_email
        flash.now[:notice] = "A password reset email has been sent to #{params[:email]}."
      else
        flash.now[:error] = "Sending password reset email failed. Please, try again later!"
      end
    else
      flash.now[:error] = 'This email does not exist.'
    end

    render 'forgotten'
  end

  # GET edit
  def edit
    user_id = get_user_id_from(params[:access_token])

    if user_id
      @user = User.find(user_id)
    else
      redirect_to forgotten_password_path, alert: 'The password change access token is invalid or expired.'
    end
  end

  # PUT update
  def update
    @user = User.find(params[:user][:id])

    if @user.update_attributes(user_params)
      login(@user)
      redirect_to my_profile_path, notice: 'The password has been successfuly changed.'
    else
      flash.now[:error] = 'The password was not changed.'
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def get_user_id_from(access_token)
    if access_token.present?
      access_token
    else
      nil
    end
  end

  def generate_access_token_for(user)
    user.id
  end

end