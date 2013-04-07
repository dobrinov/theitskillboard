ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  fixtures :all

  def login_as(user)
    @request.session[:current_user_id] = user ? user.id : nil
  end
end
