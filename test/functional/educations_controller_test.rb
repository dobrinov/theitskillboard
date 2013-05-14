require 'test_helper'

class EducationsControllerTest < ActionController::TestCase

  def setup
    @user   = users(:simple_user)
    @study  = studies(:simple_user_study)
    @course = courses(:simple_user_study_course)
  end

  test 'rendering index view' do
    login_as @user

    get :index, { :profile_id => @user.profile.id }
    assert_response :success
  end

  test 'rendering new study form' do
    login_as @user

    get :index, { :profile_id => @user.profile.id, :new => 'study' }
    assert_response :success
    assert_not_nil assigns(:study)
  end

  test 'rendering new course form' do
    login_as @user

    get :index, { :profile_id => @user.profile.id, :new => 'course', :target => @study.id }
    assert_response :success
    assert_not_nil assigns(:study)
    assert_not_nil assigns(:course)
  end

  test 'rendering new skill form' do
    login_as @user

    get :index, { :profile_id => @user.profile.id, :new => 'skill', :target => @course.id }
    assert_response :success
    assert_not_nil assigns(:study)
    assert_not_nil assigns(:course)
    assert_not_nil assigns(:skill)
  end

  test 'require login' do
    get :index, { :profile_id => @user.profile.id }
    assert_response :redirect
    assert_redirected_to :controller => 'sessions', :action => 'new'
  end

end