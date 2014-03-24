require 'net/http'

class StaticController < ApplicationController

  layout 'landingpage'

  before_action :require_no_login

  after_action :allow_iframe, only: :landingpage
  before_action :custom_domain_redirect, only: :landingpage

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

  private

  def allow_iframe
    response.headers.except! 'X-Frame-Options'
  end

  def custom_domain_redirect
    if request.domain == 'www.dobrinov.eu' || request.domain == 'dobrinov.eu'
      url = URI.parse("http://www.theitskillboard.com#{profile_path(User.where(email: 'deyan.dobrinov@gmail.com').first)}")
      req = Net::HTTP::Get.new(url.path)
      res = Net::HTTP.start(url.host, url.port) {|http|
        http.request(req)
      }

      render text: res.body
    else
      # Do nothing
    end
  end

end