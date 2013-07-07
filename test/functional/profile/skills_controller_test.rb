require 'test_helper'

class Profile::SkillsControllerTest < ActionController::TestCase

  def setup
    @user                = users(:simple_user)
    @ruby_on_rails_skill = skills(:ruby_on_rails)

    login_as @user
  end

  test 'test create impact skill' do
    assert_difference lambda { @user.skills.count }, 1 do
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

end