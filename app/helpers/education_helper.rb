module EducationHelper

  def show_new_university_form?
    params[:new].present? && params[:new] == 'study'
  end

  def show_new_course_form_for?(id)
    params[:new].present? && params[:new] == 'course' && params[:target].present? && params[:target] == id.to_s
  end

end