require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  def setup
    @company_project = projects(:simple_company_project)
    @course_project  = projects(:simple_course_project)
  end

  test 'valid project' do
    assert @company_project.valid?
  end

  test 'can associate with company' do
    assert @company_project.company.kind_of?(Company), 'Should have company provided by fixture'
    assert @company_project.course.nil?
  end

  test 'can associate with impact' do
    assert @company_project.impacts.first.kind_of?(Impact), 'Should have impact provided by fixture'
  end

  test 'can associate with course' do
    assert @course_project.course.kind_of?(Course), 'Should have course provided by fixture'
    assert @course_project.company.nil?
  end
end