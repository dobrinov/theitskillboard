module Profile::EmploymentHelper

  def show_new_employment_form?
    params[:new].present? && params[:new] == 'employment'
  end

end