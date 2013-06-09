require 'test_helper'

class SkillTest < ActiveSupport::TestCase

  def setup
    @skill = skills(:ruby)
  end

  test 'valid skill' do
    assert @skill.valid?
  end

  test 'can associate with skill category' do
    assert @skill.category.kind_of?(SkillCategory)
  end

  test 'can associate with impact' do
    impact = Impact.new

    @skill.impacts << impact

    assert @skill.valid?
    assert impact.valid?
  end

  test 'can associate with course' do
    course = Course.new

    @skill.courses << course

    assert @skill.valid?
    assert course.valid?
  end
end