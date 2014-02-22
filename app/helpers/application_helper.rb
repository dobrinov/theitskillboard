module ApplicationHelper

  def profile_picture_for(user, size, action=nil)
    profile_picture_modifiers = [size]
    profile_picture_modifiers << 'missing' unless user.avatar.exists?

    content_tag(:div, class: bem_class_for(:'profile-picture', profile_picture_modifiers)) do
      elements = []

      elements << image_tag(asset_path(user.avatar(size)))

      if action.present? && action[:url].present? && action[:text].present?
        elements << link_to(action[:text], action[:url], class: "#{bem_class_for(:button, ['primary'])} profile-picture__action")
      end

      elements.join.html_safe
    end
  end

  def time_in_ms(time)
    (time.to_f * 1000.0).to_i
  end

  def date_to_time(date)
    Time.new(date.year, date.month, date.day)
  end

  def date_in_ms(date)
    time_in_ms(date_to_time(date))
  end

end