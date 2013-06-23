require 'test_helper'

class Profile::CoursesControllerTest < ActionController::TestCase

  def setup
    @user  = users(:simple_user)
    @study = studies(:simple_user_study_in_simple_university)

    login_as @user
  end

  test "should create a course" do
    assert_difference 'Course.count', 1 do
      post :create, {
        study_id: @study.id,
        course: {
          name: "New University Course",
          from_date: Time.now - 5.months,
          to_date:   Time.now
        }
      }
    end

    assert_response :redirect
    assert_redirected_to profile_studies_path 
  end

end