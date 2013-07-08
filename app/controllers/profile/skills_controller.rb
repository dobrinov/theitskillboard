class Profile::SkillsController < Profile::CommonController

  def create
    @skill = Skill.find(params[:skill][:id])

    case params[:target_type]
    when target_type_name_for(Impact)
      @impact = current_user.impacts.detect { |i| i.id.to_s == params[:impact_id] }
      redirect_to(profile_employments_path) and return unless @impact.present?

      if @impact.skills << @skill
        flash[:notice] = 'Skill added successfuly.'
      else
        flash[:error] = 'Skill was not added.'
      end

      redirect_to profile_employments_path
    when target_type_name_for(Course)
      @course = current_user.courses.detect { |c| c.id.to_s == params[:course_id] }
      redirect_to(profile_studies_path) and return unless @course.present?

      if @course.skills << @skill
        flash[:notice] = 'Skill added successfuly.'
      else
        flash[:error] = 'Skill was not added.'
      end
      
      redirect_to profile_studies_path
    else
      redirect_to profile_path
    end

  end

end