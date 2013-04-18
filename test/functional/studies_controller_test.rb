require 'test_helper'

class StudiesControllerTest < ActionController::TestCase

  def setup
    @user = users(:simple_user)
  end

  test 'require login' do
    post :create, { :profile_id => @user.profile.id }
    assert_response :redirect
    assert_redirected_to :controller => 'sessions', :action => 'new'
  end

end