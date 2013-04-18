require 'test_helper'

class EducationsControllerTest < ActionController::TestCase

  def setup
    @user = users(:simple_user)
  end

  test 'rendering index view' do
    login_as @user

    get :index, { :profile_id => @user.id }
    assert_response :success
  end

  test 'rendering new study form' do
    login_as @user

    get :index, { :profile_id => @user.id, :new => 'study' }
    assert_response :success
    assert_not_nil assigns(:study)
  end

  test 'require login' do
    get :index, { :profile_id => @user.id }
    assert_response :redirect
    assert_redirected_to :controller => 'sessions', :action => 'new'
  end

end