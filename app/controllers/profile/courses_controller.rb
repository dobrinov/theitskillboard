class Profile::CoursesController < Profile::CommonController

  def create
    @study = current_user.profile.studies.find(params[:study_id])

    @course       = Course.new(params[:course])
    @course.study = @study

    if @course.save
      flash[:notice] = 'Course successfully added'
    else
      flash[:error] = 'Course not added'
    end

    redirect_to profile_studies_path
  end

end