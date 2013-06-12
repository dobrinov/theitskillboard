require 'test_helper'

class EmploymentsControllerTest < ActionController::TestCase

  def setup
    @user                                     = users(:simple_user)
    @company                                  = companies(:simple_company)
    @simple_user_employment_in_simple_company = employments(:simple_user_employment_in_simple_company)
  end

  test 'require login' do
    post :create, { :profile_id => @user.profile.id }
    assert_response :redirect
    assert_redirected_to :controller => 'sessions', :action => 'new'
  end

  test 'create new employment with existing company' do
    login_as @user

    assert_difference('Employment.count', 1) do
      post :create, {
        :profile_id => @user.profile.id,
        :employment => {
          :company   => { :website => @company.website },
          :position  => 'Developer',
          :from_date => Time.now - 2.years,
          :to_date   => Time.now - 1.months
        }
      }
    end

    assert_response :redirect
    assert_redirected_to :controller => 'work_experiences', :action => 'index'
  end

  test 'create new employment with not existing company' do
    login_as @user

    assert_difference(['Employment.count', 'Company.count'], 1) do
      post :create, {
        :profile_id => @user.profile.id,
        :employment => {
          :company   => { :website => 'www.newcompanywebsite.com' },
          :position  => 'Developer',
          :from_date => Time.now - 2.years,
          :to_date   => Time.now - 1.months
        }
      }
    end

    assert_response :redirect
    assert_redirected_to :controller => 'work_experiences', :action => 'index'
  end

  test 'delete employment and its associations' do
    login_as @user

    assert_difference('Employment.count', -1) do
      post :destroy, { :profile_id => @user.profile.id, id: @simple_user_employment_in_simple_company.id }
    end

    assert_response :redirect
    assert_redirected_to :controller => 'work_experiences', :action => 'index'
  end

end