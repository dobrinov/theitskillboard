require 'test_helper'

class SkillsControllerTest < ActionController::TestCase

  def setup
    @user   = users(:simple_user)
    @study  = studies(:simple_user_study_in_simple_university)
    @course = courses(:simple_user_study_course)
    @skill  = skills(:ruby)
  end

  test 'creating a skill' do
    pending "Implement"
    post :create, { :profile_id => @user.profile.id, :study_id => @study.id, :course_id => @course.id }

    assert_response :success
  end

  test 'deleting a skill' do
    pending "Implement"
    delete :destroy, { :profile_id => @user.profile.id, :study_id => @study.id, :course_id => @course.id, :id => @skill.id }

    assert_response :success
  end

  test 'it should not be able to associate the same skill with course twice' do
    pending "Implement"
  end

  test 'it should not be possible to associate a skill to a course not belonging to the current user' do
    pending "Implement"
  end

end