module EducationHelper

  def show_new_university_form?
    params[:new].present? && params[:new] == 'study'
  end

  def show_new_course_form_for?(study_id)
    params[:new].present? && params[:new] == 'course' && params[:target].present? && params[:target] == study_id.to_s
  end

  def show_new_skill_form_for?(course_id)
    params[:new].present? && params[:new] == 'skill' && params[:target].present? && params[:target] == course_id.to_s
  end

end