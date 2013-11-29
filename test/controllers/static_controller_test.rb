require 'test_helper'

class StaticControllerTest < ActionController::TestCase

  def setup
    @user = users(:simple_user)
  end

  test "should redirect to my profile if trying to access the landing page when logged in" do
    login_as @user

    get :landingpage
    assert_redirected_to my_root_path
  end

end