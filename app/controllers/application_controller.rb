class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_user
    @_current_user ||= session[:current_user_id] && User.find_by_id(session[:current_user_id])
  end

  def require_login
    redirect_to new_session_path unless logged_in?
  end

  def logged_in?
    !!current_user
  end

  helper_method :current_user, :logged_in?
end
