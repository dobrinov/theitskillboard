require 'test_helper'

class Profile::EmploymentsControllerTest < ActionController::TestCase

  def setup
    @user                   = users(:simple_user)
    @company                = companies(:simple_company)
    @non_associated_company = companies(:non_associated_company)
    @employment             = employments(:simple_user_employment_in_simple_company)

    @impact_for_company     = impacts(:simple_user_employment_in_simple_company_impact)
    @impact_in_project      = impacts(:simple_user_employment_in_simple_company_impact_in_simple_company_project)

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

  test 'render new employment project form' do
    get :index, { new: 'project', target_id: @employment.id, target_type: @employment.class.name.downcase }
    assert_template :partial => 'profile/projects/_form', count: 1
    assert_response :success
  end

  test 'render new employment impact form' do
    get :index, { new: 'impact', target_id: @employment.id, target_type: @employment.class.name.downcase }
    assert_template :partial => 'profile/impacts/_form', count: 1
    assert_response :success
  end

  test 'render new employment project impact form' do
    project = @company.projects.first
    get :index, { new: 'impact', target_id: project.id, target_type: project.class.name.downcase }
    assert_template :partial => 'profile/impacts/_form', count: 1
    assert_response :success
  end

  test 'render new employment impact skill form' do
    get :index, { new: 'skill', target_id: @impact_for_company.id, target_type: @impact_for_company.class.name.downcase }
    assert_template :partial => 'profile/skills/_form', count: 1
    assert_response :success
  end

  test 'render new employment project impact skill form' do
    get :index, { new: 'skill', target_id: @impact_in_project.id, target_type: @impact_in_project.class.name.downcase }
    assert_template :partial => 'profile/skills/_form', count: 1
    assert_response :success
  end

  test 'create new employment of existing company' do
    assert_difference lambda { User.find(@user.id).employments.count }, 1 do
      assert_no_difference 'Company.count' do
        post :create, {
          employment: { 
            company: { 
              name:    @non_associated_company.name,
              website: @non_associated_company.website
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
    assert_difference [lambda { User.find(@user.id).employments.count }, 'Company.count'], 1 do
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