class StaticController < ApplicationController

  layout 'landingpage'

  before_action :require_no_login

  after_action :allow_iframe, only: :landingpage

  def landingpage
    @title = "Welcome"
    @meta_description = "Present your programming skills and experience. Create a technology resume designed for the needs of every software developer."
    @latest_users = User.order(created_at: :desc).limit(24)
  end

  def about
    @title = "About"
  end

  def contact
    @title = "Contact"
  end

  private

  def allow_iframe
    response.headers.except! 'X-Frame-Options'
  end

end