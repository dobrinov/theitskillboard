module Profile::EmploymentsHelper

  def show_new_employment_form?
    params[:new].present? && params[:new] == 'employment'
  end

  def show_new_project_form_for?(target_id, target_type)
    [
      params[:new].present?,
      params[:new] == 'project',
      target_id.to_s == params[:target_id],
      target_type == params[:target_type]
    ].all?
  end

  def show_new_impact_form_for?(target_id, target_type)
    [
      params[:new].present?,
      params[:new] == 'impact',
      target_id.to_s == params[:target_id],
      target_type == params[:target_type]
    ].all?
  end

end