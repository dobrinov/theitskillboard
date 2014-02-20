module ContactHelper

  def contact_type_label_for(type)
    Contact.types.select { |t| t[1] == type.to_sym }[0][0]
  end

end