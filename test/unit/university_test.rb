require 'test_helper'

class UniversityTest < ActiveSupport::TestCase

  def setup
    @university = universities(:simple_university)
  end

  test 'valid university' do
    assert @university.valid?
  end

    test 'can associate with studies' do
    assert @university.studies.first.kind_of?(Study)
  end

end