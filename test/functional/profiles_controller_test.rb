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

  test "render 'Profile picture and name' edit form" do
    login_as @user

    get :edit, { :id => @user.id, :section => 'profilepictureandname' }
    assert_response :success
    assert_template 'edit'
    assert_equal css_select('input#section').first.attributes['value'], 'profilepictureandname', 'There should be a hidden field containing the section name'
  end

  test "render general information edit form" do
    login_as @user

    get :edit, { :id => @user.id, :section => 'generalinformation' }
    assert_response :success
    assert_template 'edit'
    assert_equal css_select('input#section').first.attributes['value'], 'generalinformation', 'There should be a hidden field containing the section name'
  end

  test "should update the profile general information" do
    login_as @user

    post :update, { :id => @user.id, :section => 'generalinformation', :profile => {'birth_date(3i)' => 20, 'birth_date(2i)' => 8, 'birth_date(1i)' => 1987 , :country => 'Bulgaria', :city => 'Sofia', :nationality => 'Bulgarian' } }

    assert_response :redirect
    assert_redirected_to :controller => 'profiles', :action => 'edit'
  end

  test "render experience edit form" do
    login_as @user

    get :edit, { :id => @user.id, :section => 'experience' }
    assert_response :success
    assert_template 'edit'
    assert_equal css_select('input#section').first.attributes['value'], 'experience', 'There should be a hidden field containing the section name'
  end

  test "render interests edit form" do
    login_as @user

    get :edit, { :id => @user.id, :section => 'interests' }
    assert_response :success
    assert_template 'edit'
    assert_equal css_select('input#section').first.attributes['value'], 'interests', 'There should be a hidden field containing the section name'
  end

  test "render contacts edit form" do
    login_as @user

    get :edit, { :id => @user.id, :section => 'contacts' }
    assert_response :success
    assert_template 'edit'
    assert_equal css_select('input#section').first.attributes['value'], 'contacts', 'There should be a hidden field containing the section name'
  end

  test "it should update the user picture and name" do
    pending "Test the profile picture and name submission"
  end

  test "it should redirect to profile edit page without notification if wrong section is passed" do
    pending "Test the redirect if the section hidden field is overridden."
  end

end