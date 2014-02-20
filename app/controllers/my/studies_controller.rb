class My::StudiesController < ApplicationController

  def new
    @study = Study.new
  end

  def create
    @study = current_user.studies.build(study_params)

    if current_user.save
      redirect_to back_or_default(edit_my_profile_path), notice: "Study created."
    else
      flash.now[:error] = "Study was not created."
      render :new
    end
  end

  def edit
    @study = current_user.studies.find(params[:id])
  end

  def update
    @study = current_user.studies.find(params[:id])

    if @study.update_attributes(study_params)
      redirect_to back_or_default(edit_my_profile_path), notice: "Study updated."
    else
      flash.now[:error] = "Study was not updated."
      render :edit
    end
  end

  def destroy
    @study = current_user.studies.find(params[:id])

    if @study.destroy
      flash.now[:notice] = "Study deleted."
    else
      flash.now[:error] = "Study was not deleted."
    end

    redirect_to back_or_default(edit_my_profile_path)
  end

  private

  def study_params
    params.require(:study).permit(:at, :website, :from, :to, :ongoing)
  end

end