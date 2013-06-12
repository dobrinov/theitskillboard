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

  test 'should delete all associated impacts on deletion' do
    impacts_count = @employment.impacts.count
    assert impacts_count > 0, 'There should be some impacts associated in order to test this scenario'
    assert_difference('Impact.count', -impacts_count, 'The count of deleted Impacts should match the count of associated impacts') do
      @employment.destroy
    end
  end

end