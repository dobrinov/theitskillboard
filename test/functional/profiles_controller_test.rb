require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase

  def setup
    @profile = profiles(:simple_user_profile)
  end

  test "should render a profile" do
    get :show, { :id => @profile.id }
    assert_response :success
    assert_template 'show'
  end

end