require 'test_helper'

class Profile::StudiesControllerTest < ActionController::TestCase

  def setup
    @user       = users(:simple_user)
    @university = universities(:non_associated_university)
    @study      = studies(:simple_user_study_in_simple_university)

    login_as @user
  end

  test 'render index' do
    get :index
    assert_template :partial => false
    assert_response :success
  end

  test 'render index with new study form' do
    get :index, { new: 'study' }
    assert_template :partial => '_form', count: 1
    assert_response :success
  end

  test 'render index with new course form' do
    get :index, { new: 'course', target_id: @study.id, target_type: @study.class.name.downcase }
    assert_template :partial => 'profile/courses/_form', count: 1
    assert_response :success
  end

  test 'create study of existing university' do
    assert_difference lambda { User.find(@user.id).studies.count }, 1 do
      assert_no_difference 'University.count' do
        post :create, {
          study: {
            university: {
              name:    @university.name,
              website: @university.website
            }, 
            program:   "Informatics",
            from_date: Time.now - 5.months,
            to_date:   Time.now
          }
        }
      end
    end

    assert_response :redirect
    assert_redirected_to profile_studies_path
  end

  test 'create study of non existing university' do
    assert_difference [lambda { User.find(@user.id).studies.count }, 'Study.count'], 1 do
      post :create, {
        study: {
          university: {
            name:    "Non Existing University",
            website: "www.nonexistinguniversity.com"
          }, 
          program:   "Informatics",
          from_date: Time.now - 5.months,
          to_date:   Time.now
        }
      }
    end

    assert_response :redirect
    assert_redirected_to profile_studies_path
  end

end