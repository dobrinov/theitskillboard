require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  def setup
    @user = users(:simple_user)
  end

  test "should render login form" do
    get :new
    assert_response :success
  end

  test "should login the user and redirect to root path" do
    post :create, { :email => @user.email, :password => 'qweqwe' }
    assert_redirected_to profile_root_path
  end

  test "shold show validation errors on the login form in the credentials are not valid" do
    post :create, { :email => @user.email, :password => 'wrong' }
    assert_response :success
    assert_template :new
  end

  test "should logout the user and go to the root path" do
    login_as @user

    delete :destroy, { :id => @user.id }
    assert_redirected_to root_path
  end

  test "should not be able to destroy session if not logged in" do
    delete :destroy, { :id => @user.id }
    assert_redirected_to new_session_path
  end

  test "should not be able to access the new session path if logged in" do
    login_as @user
    get :new
    assert_redirected_to root_path
  end

  test "should not be able to create new session path if logged in" do
    login_as @user
    post :create, { email: @user.email, password: @user.password }
    assert_redirected_to root_path
  end

end