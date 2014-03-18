module ProfileHelper

  def user_names_for(user)
    if user.name? || user.surname?
      "#{user.name} #{user.surname}"
    else
      "Random Developer"
    end
  end

end