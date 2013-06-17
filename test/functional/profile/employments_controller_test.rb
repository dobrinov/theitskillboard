require 'test_helper'

class Profile::EmploymentsControllerTest < ActionController::TestCase

  def setup
    @user    = users(:simple_user)
    @company = companies(:non_associated_company) 

    login_as @user
  end

  test 'render index page' do
    get :index
    assert_template :partial => false
    assert_response :success
  end

  test 'render new employment form' do
    get :index, { new: 'employment' }
    assert_template :partial => '_form', count: 1
    assert_response :success
  end

  test 'create new employment of existing company' do
    assert_difference lambda { @user.profile.employments.count }, 1 do
      assert_no_difference 'Company.count' do
        post :create, {
          employment: { 
            company: { 
              name:    @company.name,
              website: @company.website
            },
            position: "Developer",
            from_date: Time.now - 5.months,
            to_date:   Time.now - 3.months
          }
        }
      end
    end

    assert_response :redirect
    assert_redirected_to profile_employments_path
  end

  test 'create new employment of non existing company' do
    assert_difference [lambda { @user.profile.employments.count }, 'Company.count'], 1 do
      post :create, {
        employment: { 
          company: { 
            name:    "New Company Name",
            website: "www.newcompany.com"
          },
          position: "Developer",
          from_date: Time.now - 5.months,
          to_date:   Time.now - 3.months
        }
      }
    end

    assert_response :redirect
    assert_redirected_to profile_employments_path
  end

  test 'create new employment with non valid data' do
    pending 'To be implemented'
  end

end