class My::EmploymentsController < ApplicationController

  before_action :set_experience_type_in_params, only: [:create, :update]

  def new
    @employment = Employment.new
  end

  def create
    @employment = current_user.experiences.build(employment_params)

    if current_user.save
      redirect_to back_or_default(edit_my_profile_path), notice: "Employment created."
    else
      flash.now[:error] = "Employment was not created."
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def employment_params
    params.require(:employment).permit(:at, :website, :from, :to, :type)
  end

  def set_experience_type_in_params
    params[:employment].merge!(type: 'Employment')
  end

end