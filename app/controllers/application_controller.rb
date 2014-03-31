class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method \
    :current_user,
    :logged_in?

  before_action :redirect_to_regular_domain_url_version, if: :out_of_custom_domain_scope?

  def current_user
    @_current_user ||= session[:current_user_id] && User.find_by_id(session[:current_user_id])
  end

  def logged_in?
    current_user.present?
  end

  def login!(user)
    session[:current_user_id] = user.id
    user.last_login_at = Time.now
    user.login_count = (user.login_count || 0) + 1
    user.save!
  end

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to do this."
      redirect_to new_session_path(referrer_param => current_path)
    end
  end

  def require_no_login
    if logged_in?
      redirect_to my_root_path
    end
  end

  def build_skill_tree(categories, skills, category_id=nil)
    category = categories.select { |c| c.id == category_id }.first
    sub_categories = categories.select { |c| c.parent_skill_category_id == category_id }

    skill_tree = {
      sub_categories: sub_categories.map { |sc| build_skill_tree(categories, skills, sc.id) },
      skills: skills.select { |s| s.skill_category_id == category_id }
    }

    skill_tree[:id]   = category.id   if category.present?
    skill_tree[:name] = category.name if category.present?

    skill_tree
  end

  def custom_domain?
    request.domain != APP_CONFIG['domain']
  end

  def out_of_custom_domain_scope?
    custom_domain? && !(params[:controller] == 'profiles' && params[:action] == 'show' && params[:id].nil?)
  end

  def redirect_to_regular_domain_url_version
    redirect_to url_for(params.merge(host: "#{APP_CONFIG['domain']}"))
  end

  def allow_iframe
    response.headers.except! 'X-Frame-Options'
  end

  def meta_description_for_user(user)
    description = "Profile of #{user.name} #{user.surname}; "
    description << "Has experience with: #{user.skills.collect { |skill| skill.name }.join(', ').html_safe}; "
    description << "Studied in: #{user.studies.collect { |study| study.at }.join(', ').html_safe}; "
    description << "Worked for: #{user.employments.collect { |employment| employment.at }.join(', ').html_safe};"
  end

end