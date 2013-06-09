require 'test_helper'

class EmploymentTest < ActiveSupport::TestCase

  def setup
    @employment = employments(:simple_user_employment_in_simple_company)
  end

  test 'valid employment' do
    assert @employment.valid?
  end

  test 'can associate with profile' do
    assert @employment.profile.kind_of?(Profile)
  end

  test 'can associate with company' do
    assert @employment.company.kind_of?(Company)
  end

end