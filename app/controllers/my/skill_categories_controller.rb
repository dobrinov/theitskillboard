class My::SkillCategoriesController < My::CommonController

  def new
    @skill_category = SkillCategory.new
  end

  def create
    @skill_category = current_user.skill_categories.build(skill_category_params)

    if params[:parent_skill_category_id].present? && current_user.skill_categories.find(params[:parent_skill_category_id])
      @skill_category.parent_skill_category_id = params[:parent_skill_category_id]
    end

    if current_user.save
      redirect_to edit_my_profile_path, notice: "Skill category created."
    else
      flash.now[:error] = "Skill category was not created."
      render :new
    end

  end

  def edit
    @skill_category = current_user.skill_categories.find(params[:id])
  end

  def update
    @skill_category = current_user.skill_categories.find(params[:id])

    if @skill_category.update_attributes(skill_category_params)
      redirect_to edit_my_profile_path, notice: "Skill category updated."
    else
      flash.now[:error] = "Skill category was not updated."
      render :edit
    end
  end

  def destroy
    @skill_category = current_user.skill_categories.find(params[:id])

    if @skill_category.destroy
      flash[:notice] = "Skill category deleted."
    else
      flash[:error] = "Skill category was not deleted."
    end

    redirect_to edit_my_profile_path
  end

  private

  def skill_category_params
    params.require(:skill_category).permit(:name)
  end

end