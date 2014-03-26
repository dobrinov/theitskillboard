class ProfilesController < ApplicationController

  def show

    if params[:id].present?
      @user = (params[:id] == 'demo') ? User.demo_sample : User.find(params[:id])
    else
      @user = User.where(domain: request.domain).first
    end

    @title = @user.name || @user.surname ? "#{@user.name} #{@user.surname}" : "Random developer"
    @meta_description = meta_description_for_user(@user)

    @skill_tree = build_skill_tree(@user.skill_categories, @user.skills.order(level: :desc))
  end

end