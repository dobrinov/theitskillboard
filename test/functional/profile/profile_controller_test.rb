require 'test_helper'

class Profile::ProfileControllerTest < ActionController::TestCase

  def setup
    @user = users(:simple_user)

    login_as @user
  end

  test "show profile" do
    get :show

    assert_response :success
    assert_template 'show'
  end

  test "edit profile" do
    get :edit

    assert_response :success
    assert_template 'edit'
  end

  test "edit profile_picture_and_name" do
    get :profile_picture_and_name

    assert_response :success
    assert_template 'profile_picture_and_name'
  end

  test "edit location_nationality_and_age" do
    get :location_nationality_and_age

    assert_response :success
    assert_template 'location_nationality_and_age'
  end

  test "update profile picture and name" do
    name    = 'changedname'
    surname = 'changedsurname'

    put :update, { 
      profile: {
        name:            name,
        surname:         surname,
        profile_picture: fixture_file_upload('images/dummy.jpg','image/jpeg')
      }
    }

    assert @user.profile.name    == name,    'The user name should be changed'
    assert @user.profile.surname == surname, 'The user surname should be changed'

    assert_response :redirect
    assert_redirected_to profile_edit_path
  end

  test "update age nationality and age" do
    country     = 'changedcountry'
    city        = 'changedcity'
    nationality = 'changednationality'

    put :update, {
      profile: {
        birth_date:  (Time.now - 25.years),
        country:     country,
        city:        city,
        nationality: nationality
      }
    }

    assert @user.profile.country     == country,     'The country should be changed'
    assert @user.profile.city        == city,        'The city should be changed'
    assert @user.profile.nationality == nationality, 'The nationality should be changed'

    assert_response :redirect
    assert_redirected_to profile_edit_path
  end

end