class StaticController < ApplicationController

  layout 'landingpage'

  before_action :require_no_login

  def landingpage
  end

end