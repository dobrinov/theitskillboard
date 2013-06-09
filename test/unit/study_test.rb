require 'test_helper'

class StudyTest < ActiveSupport::TestCase
    
  def setup
    @study = studies(:simple_user_study_in_simple_university)
  end

  test 'valid study' do
    assert @study.valid?
  end

  test 'can associate with profile' do
    assert @study.profile.kind_of?(Profile)
  end

  test 'can associate with university' do
    assert @study.university.kind_of?(University)
  end

  test 'can associate with course' do
    assert @study.courses.first.kind_of?(Course)
  end

end