require 'test_helper'

class WorkExperiencesControllerTest < ActionController::TestCase

  def setup
    @user  = users(:simple_user)
  end

  test 'rendering index view' do
    login_as @user

    get :index, { :profile_id => @user.profile.id }
    assert_response :success
  end

  test 'redirect to login page if not logged in' do
    get :index, { :profile_id => @user.profile }
    assert_response :redirect
    assert_redirected_to :controller => 'sessions', :action => 'new'
  end

end