require 'test_helper'

class ContactsControllerTest < ActionController::TestCase

  def setup
    @user    = users(:simple_user)
    @contact = contacts(:simple_user_profile_contact)
  end

  test 'interests index action' do
    login_as @user

    get :index, { :profile_id => @user.profile.id }

    assert_response :success
  end

  test 'redirect to login page if not logged in' do
    get :index, { :profile_id => @user.profile.id }
    assert_response :redirect
    assert_redirected_to :controller => 'sessions', :action => 'new'
  end

  test 'create profile contact' do
    login_as @user

    assert_difference('Contact.count') do
      post :create, { :profile_id => @user.profile.id, :contact => { :contact_type => 'facebook', :address => 'dobrinov' } }
    end

    assert_response :redirect
    assert_redirected_to :controller => 'contacts', :action => 'index'
  end

  test 'deltete profile contact' do
    login_as @user

    assert_difference('Contact.count', -1) do
      delete :destroy, { :profile_id => @user.profile.id, :id => @contact.id }
    end
  end

end