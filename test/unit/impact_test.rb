require 'test_helper'

class ImpactTest < ActiveSupport::TestCase
  def setup
    @simple_user_employment_in_simple_company_impact_in_simple_company_project = impacts(:simple_user_employment_in_simple_company_impact_in_simple_company_project)
    @simple_user_employment_in_simple_company_impact                           = impacts(:simple_user_employment_in_simple_company_impact)
  end

  test 'valid impact' do
    assert @simple_user_employment_in_simple_company_impact_in_simple_company_project.valid?
    assert @simple_user_employment_in_simple_company_impact.valid?
  end

  test 'can associate with project' do
    assert @simple_user_employment_in_simple_company_impact_in_simple_company_project.project.kind_of?(Project), 'Should have project provided by fixture'
  end

  test 'can associate with employment' do
    assert @simple_user_employment_in_simple_company_impact.employment.kind_of?(Employment), 'Should have employment provided by fixture'
  end

  test 'can associate with skill' do
    skill = Skill.find(1)

    @simple_user_employment_in_simple_company_impact.skills << skill

    assert @simple_user_employment_in_simple_company_impact.valid?
    assert skill.valid?
  end
end