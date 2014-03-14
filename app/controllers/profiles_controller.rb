class ProfilesController < ApplicationController

  def show
    if params[:id] == 'demo'
      @user = User.joins(:skills).group("users.id").having("count(skills.id) > 6").sample
    else
      @user = User.find(params[:id])
    end

    @title = @user.name || @user.surname ? "#{@user.name} #{@user.surname}" : "Random user"

    @skill_tree = build_skill_tree(@user.skill_categories, @user.skills.order(level: :desc))
  end

end