require 'test_helper'

class SkillsControllerTest < ActionController::TestCase

  def setup
    @user   = users(:simple_user)
    @study  = studies(:simple_user_study)
    @course = courses(:simple_user_study_course)
    @skill  = skills(:ruby)
  end

  test 'creating a skill' do
    post :create, { :profile_id => @user.profile.id, :study_id => @study.id, :course_id => @course.id }

    assert_response :success
  end

  test 'deleting a skill' do
    delete :destroy, { :profile_id => @user.profile.id, :study_id => @study.id, :course_id => @course.id, :id => @skill.id }

    assert_response :success
  end

end