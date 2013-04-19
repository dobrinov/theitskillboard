require 'test_helper'

class InterestsControllerTest < ActionController::TestCase

  def setup
    @user     = users(:simple_user)
    @interest = interests(:programming)
  end

  test 'interests index action' do
    login_as @user

    get :index, { :profile_id => @user.profile.id }

    assert_response :success
  end

  test 'redirect to login page if not logged in' do
    get :index, { :profile_id => @user.profile.id }
    assert_response :redirect
    assert_redirected_to :controller => 'sessions', :action => 'new'
  end

  test 'create profile interest' do
    login_as @user

    assert_difference('Interest.count') do
      post :create, { :profile_id => @user.profile.id, :interest => { :name => 'Programming' } }
    end

    assert_response :redirect
    assert_redirected_to :controller => 'interests', :action => 'index'
  end

  test 'delete profile interest' do
    login_as @user

    assert_difference('Interest.count', -1) do
      delete :destroy, { :profile_id => @user.profile.id, :id => @interest.id }
    end

    assert_response :redirect
    assert_redirected_to :controller => 'interests', :action => 'index'
  end

end