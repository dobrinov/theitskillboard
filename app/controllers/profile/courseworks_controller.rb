class Profile::CourseworksController < Profile::CommonController

  def create
    @project = Project.new params[:project]
    @course = current_user.courses.detect { |c| c.id.to_s == params[:course_id] }
    redirect_to(profile_studies_path) and return unless @course.present?

    if @course.project = @project
      flash[:notice] = 'Coursework added successfuly.'
    else
      flash[:error] = 'Coursework was not added.'
    end

    redirect_to profile_studies_path

  end

end