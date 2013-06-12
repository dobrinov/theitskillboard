class EmploymentsController < ApplicationController

  before_filter :require_login

  def create
    company_params = params[:employment].delete(:company)

    @company    = Company.where(:website => company_params[:website]).first_or_create
    @employment = Employment.new params[:employment]

    if @company.new_record?
      @company.update_attributes company_params
    end

    @employment.profile = current_user.profile
    @employment.company = @company

    if @employment.save
      redirect_to profile_work_experiences_path
    else
      # Make it better
      redirect_to profile_work_experiences_path
    end

  end

  def destroy
    @employment = current_user.profile.employments.find(params[:id])

    if @employment.destroy
      redirect_to profile_work_experiences_path
    else
      # Make it better
      redirect_to profile_work_experiences_path
    end
  end

end