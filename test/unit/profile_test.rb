require 'test_helper'

class ProfileTest < ActiveSupport::TestCase

  test "full_name" do
    profile = Profile.new
    name    = profile.name    = 'Deyan'
    surname = profile.surname = 'Dobrinov'

    assert profile.full_name == "#{name} #{surname}"
  end

  test "general_information_added?" do
    profile = Profile.new

    assert !profile.general_information_added?, 'There should be no info on newly created profile'

    profile.country = 'Bulgaria'
    assert profile.general_information_added?, 'The result should be true if at least one of the fields is filled'

    profile.city        = 'Sofia'
    profile.nationality = 'Bulgarian'
    profile.birth_date  = Time.now
    assert profile.general_information_added?, 'The result should be true if all fields are filled'

    profile.country     = ''
    profile.city        = ''
    profile.nationality = ''
    profile.birth_date  = ''

    assert !profile.general_information_added?, 'The result should be false if the fields are nulled'
  end

  test "that it should not be possible to associate more than one contact with the same type" do
    pending "TODO"
  end

end