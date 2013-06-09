require 'test_helper'

class ImpactTest < ActiveSupport::TestCase
  def setup
    @simple_company_project_impact = impacts(:simple_company_project_impact)
    @simple_company_impact         = impacts(:simple_company_impact)
  end

  test 'valid impact' do
    assert @simple_company_project_impact.valid?
    assert @simple_company_impact.valid?
  end

  test 'can associate with project' do
    assert @simple_company_project_impact.project.kind_of?(Project), 'Should have project provided by fixture'
  end

  test 'can associate with company' do
    assert @simple_company_impact.company.kind_of?(Company), 'Should have company provided by fixture'
  end

  test 'can associate with skill' do
    skill = Skill.find(1)

    @simple_company_project_impact.skills << skill

    assert @simple_company_project_impact.valid?
    assert skill.valid?
  end
end