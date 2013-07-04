class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method \
    :target_type_name_for,
    :current_user,
    :logged_in?

  private

  def target_type_name_for(object)
    object.to_s.downcase
  end

  def current_user
    @_current_user ||= session[:current_user_id] && User.find_by_id(session[:current_user_id])
  end

  def require_login
    redirect_to new_session_path unless logged_in?
  end

  def logged_in?
    current_user.present?
  end
end