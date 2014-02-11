class My::SkillsController < My::CommonController

  def new
    @skill = Skill.new
  end

  def create
    @skill = current_user.skills.build(skill_params)

    if params[:skill_category_id].present? && current_user.skill_categories.find(params[:skill_category_id])
      @skill.skill_category_id = params[:skill_category_id]
    end

    if current_user.save
      redirect_to edit_my_profile_path, notice: "Skill created."
    else
      flash.now[:error] = "Skill was not created."
      render :new
    end
  end

  def edit
    @skill = current_user.skills.find(params[:id])
  end

  def update
    @skill = current_user.skills.find(params[:id])

    if @skill.update_attributes(skill_params)
      redirect_to edit_my_profile_path, notice: "Skill updated."
    else
      flash.now[:error] = "Skill was not updated."
      render :edit
    end
  end

  def destroy
    @skill = current_user.skills.find(params[:id])

    if @skill.destroy
      flash[:notice] = "Skill deleted."
    else
      flash[:error] = "Skill was not deleted."
    end

    redirect_to edit_my_profile_path
  end

  private

  def skill_params
    params.require(:skill).permit(:name, :level)
  end

end