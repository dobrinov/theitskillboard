class StudiesController < ApplicationController

  before_filter :require_login

  def create
    university_params = params[:study].delete(:university)

    @profile    = current_user.profile
    @university = University.where(:website => university_params[:website]).first_or_create
    @study      = Study.new params[:study]

    if @university.new_record?
      @university.update_attributes university_params
    end

    @study.profile    = @profile
    @study.university = @university

    @study.save

    render 'educations/index'
  end

  def update
  end

  def destroy
  end

end