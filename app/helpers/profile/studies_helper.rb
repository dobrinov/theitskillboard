module Profile::StudiesHelper

  def show_new_study_form?
    params[:new].present? && params[:new] == 'study'
  end

  def show_new_course_form?(target_id, target_type)
    [
      params[:new].present?,
      params[:new] == 'course',
      target_id.to_s == params[:target_id],
      target_type == params[:target_type]
    ].all?
  end 

end