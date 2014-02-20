class My::InterestsController < My::CommonController

  def new
    @interest = Interest.new
  end

  def create
    @interest = current_user.interests.build(interest_params)

    if current_user.save
      redirect_to back_or_default(edit_my_profile_path), notice: "Interest created."
    else
      flash.now[:error] = "Interest not created."
      render :new
    end
  end

  def edit
    @interest = current_user.interests.find(params[:id])
  end

  def update
    @interest = current_user.interests.find(params[:id])

    if @interest.update_attributes(interest_params)
      redirect_to back_or_default(edit_my_profile_path), notice: "Interest updated."
    else
      flash.now[:error] = "Interest not updated."
      render :edit
    end
  end

  def destroy
    @interest = current_user.interests.find(params[:id])

    if @interest.destroy
      flash[:notice] = "Interest deleted."
    else
      flash[:error] = "Interest not deleted."
    end

    redirect_to back_or_default(edit_my_profile_path)
  end

  private

  def interest_params
    params.require(:interest).permit(:name)
  end

end