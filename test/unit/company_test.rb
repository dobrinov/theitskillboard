require 'test_helper'

class CompanyTest < ActiveSupport::TestCase

  def setup
    @company = companies(:simple_company)
  end

  test 'valid company' do
    assert @company.valid?
  end

  test 'can associate with employments' do
    assert @company.employments.first.kind_of?(Employment)
  end

  test 'can associate with projects' do
    assert @company.projects.first.kind_of?(Project)
  end
end