class CoursesController < ApplicationController

  before_filter :require_login

  def create
    @study = current_user.profile.studies.find(params[:study_id])

    @study.courses << Course.new(params[:course])

    if @study.save
      flash[:notice] = 'Course successfully added'
    else
      flash[:error] = 'Course not added'
    end

    redirect_to profile_educations_path
  end

  def update
  end

  def destroy
  end

end