module NavigationHelper

  def profile_link
    if params[:controller] == 'profiles' && params[:action] == 'edit'
      link_to 'Show profile', profile_path(current_user), class: 'button small'
    else
      link_to 'Edit profile', edit_profile_path(current_user), class: 'button primary small'
    end
  end
end