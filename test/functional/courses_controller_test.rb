require 'test_helper'

class CoursesControllerTest < ActionController::TestCase

  def setup
    @user  = users(:simple_user)
    @study = studies(:simple_user_study_in_simple_university)
  end

  test 'creatign a course for study' do
    login_as @user

    assert_difference('Course.count') do
      post  :create, {
              :study_id   => @study.id,
              :profile_id => @user.profile.id,
              :course     => { :name => 'Course name', :from_date => (Time.now - 3.months), :to_date => (Time.now - 2.months) }
           }
    end

    assert_response :redirect
    assert_redirected_to :controller => 'educations', :action => 'index'
  end

  test 'redirect if not user owned or not exisiting study id' do
    login_as @user

    assert_raise(ActiveRecord::RecordNotFound) do
      post  :create, {
              :study_id   => 666,
              :profile_id => @user.profile.id,
              :course     => { :name => 'Course name', :from_date => (Time.now - 3.months), :to_date => (Time.now - 2.months) }
            }
    end

  end

  test 'require login' do
    post  :create, {
              :study_id   => @study.id,
              :profile_id => @user.profile.id,
              :course     => { :name => 'Course name', :from_date => (Time.now - 3.months), :to_date => (Time.now - 2.months) }
           }

    assert_response :redirect
    assert_redirected_to :controller => 'sessions', :action => 'new'
  end

end