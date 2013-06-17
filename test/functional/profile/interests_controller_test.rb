require 'test_helper'

class Profile::InterestsControllerTest < ActionController::TestCase

  def setup
    @user = users(:simple_user)

    login_as @user
  end

  test 'render index' do
    get :index
    assert_response :success
  end

  test 'add valid interest' do
    assert_difference('Interest.count', 1) do
      post :create, { interest: { name: "programming" }}
    end

    assert_response :redirect
    assert_redirected_to profile_interests_path
  end

  test 'it will use an existing interest' do
    pending 'To be implemented...'
  end

  test 'delete interest' do
    assert @user.profile.interests.count > 0, 'The user should have some interest associated'

    assert_difference('Interest.count', -1) do
      delete :destroy, { id: @user.profile.interests.first.id }
    end

    assert_response :redirect, 'The user should be redirected after deletion of the inerest'
    assert_redirected_to profile_interests_path
  end

end