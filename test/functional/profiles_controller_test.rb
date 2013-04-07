require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase

  def setup
    @user = users(:simple_user)
  end

  test "should render a profile" do
    login_as @user

    get :show, { :id => @user.id }
    assert_response :success
    assert_template 'show'
  end

  test "should render edit profile page" do
    login_as @user

    get :edit, { :id => @user.id }
    assert_response :success
    assert_template 'edit'
  end

  test "should render edit profile page main section on invalid section parameter" do
    login_as @user

    get :edit, { :id => @user.id, :section => 'invalid' }
    assert_response :success
    assert_template 'edit'
  end

  test "'profilepictureandname' parameter should render 'profile picture and name' form on edit profile page" do
    login_as @user

    get :edit, { :id => @user.id, :section => 'profilepictureandname' }
    assert_response :success
    assert_template 'edit'
  end

end