require 'test_helper'

class ProfileTest < ActiveSupport::TestCase

  def setup
    @profile = profiles(:simple_user_profile)
  end

  test "valid profile" do
    assert @profile.valid?, 'The default fixture should define a valid profile'
  end

  test "can associate with contacts" do
    contact = Contact.new(address: 'email@example.com', contact_type: 'email')

    @profile.contacts << contact

    assert @profile.valid?
    assert contact.valid?
  end

  test "can associate with interests" do
    interest = Interest.new(name: 'Interest')

    @profile.interests << interest

    assert @profile.valid?
    assert interest.valid?
  end

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

end