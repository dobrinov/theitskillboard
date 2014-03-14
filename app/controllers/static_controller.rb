class StaticController < ApplicationController

  layout 'landingpage'

  before_action :require_no_login

  after_action :allow_iframe, only: :landingpage

  def landingpage
  end

  def allow_iframe
    response.headers.except! 'X-Frame-Options'
  end

end