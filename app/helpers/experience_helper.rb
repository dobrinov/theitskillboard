module ExperienceHelper

  def experience_period_for(experience)
    from = experience.from.strftime('%d.%m.%Y')
    to = experience.ongoing? ? 'Present' : experience.to.strftime('%d.%m.%Y')

    "(#{from} - #{to})"
  end

  def experience_edit_path_for(experience)
    if experience.employment?
      edit_my_employment_path(experience)
    elsif experience.study?
      edit_my_study_path(experience)
    else
      raise "There is no path for this type of experience."
    end
  end

  def experience_path_for(experience)
    if experience.employment?
      my_employment_path(experience)
    elsif experience.study?
      my_study_path(experience)
    else
      raise "There is no path for this type of experience."
    end
  end

end