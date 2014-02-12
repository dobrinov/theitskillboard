class My::ProfilesController < My::CommonController

  def show
    @user = current_user
  end

  def edit
    @user = current_user
    @skill_tree = build_skill_tree(current_user.skill_categories, current_user.skills.order(level: :desc))
  end

  def update
    @user = current_user
    @skill_tree = build_skill_tree(current_user.skill_categories, current_user.skills.order(level: :desc))

    if @user.update_attributes(user_params)
      flash.now[:notice] = "Profile updated."
    else
      flash.now[:notice] = "Failed to update profile."
    end

    render :edit
  end

  private

  def user_params
    params.require(:user).permit(:name, :surname, :definition,
                                 :birth_date, :gender,
                                 :country, :city, :nationality)
  end

  def build_skill_tree(categories, skills, category_id=nil)
    category = categories.select { |c| c.id == category_id }.first
    sub_categories = categories.select { |c| c.parent_skill_category_id == category_id }

    skill_tree = {
      sub_categories: sub_categories.map { |sc| build_skill_tree(categories, skills, sc.id) },
      skills: skills.select { |s| s.skill_category_id == category_id }
    }

    skill_tree[:id]   = category.id   if category.present?
    skill_tree[:name] = category.name if category.present?

    skill_tree
  end

end