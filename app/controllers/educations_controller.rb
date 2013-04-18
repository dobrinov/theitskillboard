class EducationsController < ApplicationController

  before_filter :require_login

  def index

    @profile = current_user.profile

    case params[:new]
    when 'study'
      @study = Study.new
      @study.build_university
    end

  end
end