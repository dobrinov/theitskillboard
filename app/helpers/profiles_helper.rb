module ProfilesHelper

  def user_general_information_fields
    [:birthdate, :gender, :city, :country, :nationality]
  end

  def has_general_information_for?(user)
    user_general_information_fields.collect { |f| user.send(f).present? }.any?
  end

  def location_string_for?(user)
    user.country.present? || user.city.present?
  end

  def location_string_for(user)
    location_array = []
    location_array << user.city    if user.city.present?
    location_array << user.country if user.country.present?

    location_array.join(', ')
  end

end