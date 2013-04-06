module ApplicationHelper
  def render_flash_messages

    if flash[:error]
      return page_danger_message flash[:error]
    end

    if flash[:notice]
      return page_success_message flash[:notice]
    end

  end

  def page_message(message, type='information')
    return content_tag :div, message, class: "page-message #{type}"
  end

  def page_information_message(message)
    page_message(message)
  end

  def page_success_message(message)
    page_message(message, 'success')
  end

  def page_warning_message(message)
    page_message(message, 'warning')
  end

  def page_danger_message(message)
    page_message(message, 'danger')
  end

end