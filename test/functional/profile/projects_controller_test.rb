require 'test_helper'

class Profile::ProjectsControllerTest < ActionController::TestCase

  def setup
    @user       = users(:simple_user)
    @employment = @user.employments.first

    login_as @user
  end

  test 'create employment project with valida data' do
    assert_difference 'Project.count', 1 do
      post :create, {
        employment_id: @employment.id,
        project: {
          name:        "Project name",
          description: "description",
          website:     "www.projectwebsite.com"
        }
      }
    end

    assert_redirected_to profile_employments_path
  end

  test 'create project with not owned by the yser target id' do
    assert_no_difference 'Project.count' do
      post :create, {
        employment_id: 666,
        project: {
          name:        "Project name",
          description: "description",
          website:     "www.projectwebsite.com"
        }
      }
    end

    assert_redirected_to profile_employments_path
  end

end