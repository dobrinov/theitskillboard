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

    else
      # Do nothing
    end

    redirect_to profile_employments_path
  end

end