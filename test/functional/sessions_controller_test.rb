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
    assert_redirected_to root_path
  end

  test "shold show validation errors on the login form in the credentials are not valid" do
    post :create, { :email => @user.email, :password => 'wrong' }
    assert_response :success
    assert_template :new
  end

  test "should logout the user and go to the root path" do
    delete :destroy, { :id => @user.id }
    assert_redirected_to root_path
  end

end