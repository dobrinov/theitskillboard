require 'test_helper'

class Profile::SkillsControllerTest < ActionController::TestCase

  def setup
    @user                = users(:simple_user)
    @ruby_on_rails_skill = skills(:ruby_on_rails)

    login_as @user
  end

  test 'test create impact skill' do
    assert_difference lambda { User.find(@user.id).skills.count }, 1 do
      post :create, {
        skill: {
          id: @ruby_on_rails_skill.id
        },
        target_type: 'impact',
        impact_id:   @user.impacts.first.id
      }

      assert_redirected_to profile_employments_path
    end
  end

  test 'test create course skill' do
    assert_difference lambda { User.find(@user.id).skills.count }, 1 do
      post :create, {
        skill: {
          id: @ruby_on_rails_skill.id
        },
        target_type: 'course',
        course_id:   @user.courses.first.id
      }

      assert_redirected_to profile_studies_path
    end
  end

  test 'create with invalid target_type' do
    post :create, {
      skill: {
        id: @ruby_on_rails_skill.id
      },
      target_type: 'wrong',
      impact_id:   @user.impacts.first.id
    }

    assert_redirected_to profile_path
  end

end