module WorkExperienceHelper

  def show_new_employment_form?
    params[:new].present? && params[:new] == 'employment'
  end

end