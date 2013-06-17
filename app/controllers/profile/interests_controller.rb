class Profile::InterestsController < Profile::CommonController

  def index
    @interests = current_user.profile.interests
    @interest  = Interest.new
  end

  def create
    @interest = Interest.new(params[:interest])

    if current_user.profile.interests << @interest
      flash[:notice] = 'Interest added successfuly.'
    else
      flash[:error] = 'Interest was not added.'
    end

    redirect_to profile_interests_path
  end

  def destroy
    @interest = current_user.profile.interests.find(params[:id])

    if @interest.destroy
      flash[:notice] = "Interest removed successfuly."
    else
      flash[:error] = "Interest was not removed."
    end

    redirect_to profile_interests_path
  end

end