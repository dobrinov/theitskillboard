class InterestsController < ApplicationController

  def new
    @interests = current_user.profile.interests 
    @profile   = current_user.profile
    @interest  = Interest.new
  end

  def create
    @profile  = current_user.profile
    @interest = Interest.new params[:interest]

    @profile.interests << @interest

    if @profile.save
      redirect_to new_profile_interest_path(@profile.id), notice: 'Interest successfuly added'
    else
    end

  end

  def destroy
    @profile = current_user.profile

    if Interest.find(params[:interest][:id]).destroy
      flash[:notice] = "Inerest removed successfuly"
    else
      flash[:error] = "Inerest not removed"
    end

    redirect_to new_profile_interest_path(@profile.id)
  end

end