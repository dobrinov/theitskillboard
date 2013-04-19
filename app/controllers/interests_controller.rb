class InterestsController < ApplicationController

  before_filter :require_login

  def index
    @profile   = current_user.profile
    @interests = @profile.interests
    @interest  = Interest.new
  end

  def create
    @profile  = current_user.profile
    @interest = Interest.new params[:interest]

    @profile.interests << @interest

    if @profile.save
      flash[:notice] = 'Interest successfuly added'
    else
      flash[:error] = 'Interest was not added'
    end

    redirect_to profile_interests_path(@profile.id)

  end

  def destroy
    @profile = current_user.profile

    if Interest.find(params[:id]).destroy
      flash[:notice] = "Inerest removed successfuly"
    else
      flash[:error] = "Inerest not removed"
    end

    redirect_to profile_interests_path(@profile.id)
  end

end