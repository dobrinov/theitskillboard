class ProfilesController < ApplicationController

  def show
    if params[:id] == 'demo'
      params[:id] = (1..User.count).to_a.sample
    end

    @user = User.find(params[:id])
    @skill_tree = build_skill_tree(@user.skill_categories, @user.skills.order(level: :desc))
  end

end