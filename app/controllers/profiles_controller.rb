class ProfilesController < ApplicationController

  def show
    if params[:id] == 'demo'
      @user = User.new(demo_user)
    else
      @user = User.find(params[:id])
    end

    @skill_tree = build_skill_tree(@user.skill_categories, @user.skills.order(level: :desc))
  end

  private

  def demo_user
  end

end