class ProfilesController < ApplicationController

  def show
    @user = User.find(params[:id])
    @skill_tree = build_skill_tree(@user.skill_categories, @user.skills.order(level: :desc))
  end

end