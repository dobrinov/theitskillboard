module NavigationHelper

  def profile_link
    if params[:controller] == 'profile/profile' && params[:action] == 'edit'
      link_to 'Preview profile', profile_preview_path, class: 'button small'
    else
      link_to 'Edit profile', profile_edit_path, class: 'button primary small'
    end
  end
end