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

    @employment.save

    redirect_to profile_work_experiences_path
  end

  def update
  end

  def destroy
  end

end