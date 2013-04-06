module FormHelper
  def error_messages_for(object, field)
    if object.errors[field].any?
      content_tag :span, object.errors[field].first, class: 'error-message'
    end
  end
end