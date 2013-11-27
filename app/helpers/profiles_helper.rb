module ProfilesHelper

  def user_general_information_fields
    [:birthdate, :gender, :city, :country, :nationality]
  end

  def has_general_information_for?(user)
    user_general_information_fields.collect { |f| user.send(f).present? }.any?
  end

end