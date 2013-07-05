class Profile::ProjectsController < Profile::CommonController

  def create
    @project    = Project.new params[:project]
    @employment = current_user.employments.detect { |e| e.id.to_s == params[:employment_id] }
    redirect_to(profile_employments_path) and return unless @employment.present?

    if @employment.company.projects << @project
      flash[:notice] = 'Project added successfuly.'
    else
      flash[:error] = 'Project was not added.'
    end

    redirect_to profile_employments_path
  end

end