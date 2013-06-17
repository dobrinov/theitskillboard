require 'test_helper'

class Profile::ContactsControllerTest < ActionController::TestCase

  def setup
    @user = users(:simple_user)

    login_as @user
  end

  test 'render index' do
    get :index
    assert_response :success
  end

  test 'add valid contact' do
    assert_difference('Contact.count', 1) do
      post :create, { contact: { contact_type: "email", address: "deyan.dobrinov@example.com" }}
    end

    assert_response :redirect
    assert_redirected_to profile_contacts_path
  end

  test 'delete contact' do
    assert @user.profile.contacts.count > 0, 'The user should have some contacts associated'

    assert_difference('Contact.count', -1) do
      delete :destroy, { id: @user.profile.contacts.first.id }
    end

    assert_response :redirect, 'The user should be redirected after deletion of the contact'
    assert_redirected_to profile_contacts_path
  end

end