class EducationsController < ApplicationController

  before_filter :require_login

  def index

    @profile = current_user.profile

    case params[:new]
    when 'study'
      @study = Study.new
      @study.build_university
    when 'course'
      @study  = current_user.profile.studies.find(params[:target])
      @course = Course.new
    when 'skill'
      @course = Course.find(params[:target])
      @study  = @course.study
      @skill  = Skill.new
    end

  end
end