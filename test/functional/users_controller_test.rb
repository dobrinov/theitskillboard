require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  
  test "rendering signup page is successful" do
    get :new
    assert_response :success
  end

  test "should redirect to successful sign up page" do

    assert_difference('User.count') do
      post :create, :user => { :email => 'validemail@example.com', :password => 'qweqwe', :password_confirmation => 'qweqwe'}
    end
   
    assert_redirected_to profile_path(assigns(:user))
  end

  test "should create profile for the user" do
    assert_difference('Profile.count') do
      post :create, :user => { :email => 'validemail@example.com', :password => 'qweqwe', :password_confirmation => 'qweqwe'}
    end
  end

  test "should show form with error messages" do
    post :create, :user => {}
    assert_response :success
    assert_template :new
  end

end