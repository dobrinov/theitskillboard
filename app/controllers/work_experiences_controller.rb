class WorkExperiencesController < ApplicationController

  before_filter :require_login

  def index

    case params[:new]
    when 'employment'
      @employment = Employment.new
      @employment.build_company
    when 'project'
    when 'skill'
    end

  end
end