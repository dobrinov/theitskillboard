require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  test "should render login form" do
    get :new
    assert_response :success
  end

  test "should login the user and redirect to root path" do
    raise User.last.password_digest.inspect
    post :create, { :email => 'sample.user@example.com', :password => 'qweqwe' }
    assert_redirected_to root_path
  end

  test "shold show validation errors on the login form in the credentials are not valid" do
    post :create, { :email => 'sample.user@example.com', :password => 'wrong' }
    assert_response :success
    assert_template :new
  end

  test "should logout the user and go to the root path" do
    delete :destroy
    assert_redirected_to root_path
  end

end