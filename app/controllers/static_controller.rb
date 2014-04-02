class StaticController < ApplicationController

  layout 'landingpage'

  before_action :require_no_login

  after_action :allow_iframe, only: :landingpage

  def landingpage
    @title = "Welcome"
    @meta_description = "Present your programming skills and experience. Create a technology resume designed for the needs of every software developer."
  end

  def about
    @title = "About"
  end

  def contact
    @title = "Contact"
  end

  def bye
    @title = "Bye, bye"
  end

end