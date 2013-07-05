require 'test_helper'

class Profile::ImpactsControllerTest < ActionController::TestCase

  def setup
    @user       = users(:simple_user)
    @employment = @user.employments.first
    @project    = @employment.company.projects.first

    login_as @user
  end

  test 'create employment impact with valida data' do
    assert_difference 'Impact.count', 1 do
      post :create, {
        target_id:   @employment.id,
        target_type: "employment",
        impact: {
          description: "description",
          from:        Time.now - 1.year,
          to:          Time.now - 2.months
        }
      }
    end

    assert_redirected_to profile_employments_path
  end

  test 'create project impact with valida data' do
    assert_difference 'Impact.count', 1 do
      post :create, {
        target_id:   @project.id,
        target_type: "project",
        impact: {
          description: "description",
          from:        Time.now - 1.year,
          to:          Time.now - 2.months
        }
      }
    end

    assert_redirected_to profile_employments_path
  end

  test 'create with missing target type' do
    assert_no_difference 'Impact.count' do
      post :create, {
        target_id:   1,
        impact: {
          description: "description",
          from:        Time.now - 1.year,
          to:          Time.now - 2.months
        }
      }
    end

    assert_redirected_to profile_employments_path
  end

  test 'create with missing target id' do
    assert_no_difference 'Impact.count' do
      post :create, {
        target_type: "employment",
        impact: {
          description: "description",
          from:        Time.now - 1.year,
          to:          Time.now - 2.months
        }
      }
    end

    assert_redirected_to profile_employments_path
  end

  test 'create with missing not owned by the yser target id' do
    assert_no_difference 'Impact.count' do
      post :create, {
        target_id:   666,
        target_type: "employment",
        impact: {
          description: "description",
          from:        Time.now - 1.year,
          to:          Time.now - 2.months
        }
      }
    end

    assert_redirected_to profile_employments_path
  end

end