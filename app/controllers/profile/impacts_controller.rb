class Profile::ImpactsController < Profile::CommonController

  def create

    @impact = Impact.new params[:impact]

    case params[:target_type]
    when target_type_name_for(Employment)
      @employment = current_user.employments.detect { |e| e.id.to_s == params[:target_id] }
      redirect_to(profile_employments_path) and return unless @employment.present?

      if @employment.impacts << @impact
        flash[:notice] = 'Impact added successfuly.'
      else
        flash[:error] = 'Impact was not added.'
      end

    when target_type_name_for(Project)
      @project = current_user.projects.detect{ |p| p.id.to_s == params[:target_id] }
      redirect_to(profile_employments_path) and return unless @project.present?

      if @project.impacts << @impact
        flash[:notice] = 'Impact added successfuly.'
      else
        flash[:error] = 'Impact was not added.'
      end

    else
      # Do nothing
    end

    redirect_to profile_employments_path

  end

end