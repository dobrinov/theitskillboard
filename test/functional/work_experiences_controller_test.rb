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

end