require 'test_helper'

class ProfilesHelperTest < ActionView::TestCase

  #user_general_information_fields
  test "user_general_information_fields should be present" do
    assert user_general_information_fields.present?
  end

  test "has_general_information_for? should be true with at least one avaialble field value" do
    assert has_general_information_for?(User.new(birthdate:   Time.now))    == true
    assert has_general_information_for?(User.new(gender:      'm'))         == true
    assert has_general_information_for?(User.new(city:        'Sofia'))     == true
    assert has_general_information_for?(User.new(country:     'Bulgaria'))  == true
    assert has_general_information_for?(User.new(nationality: 'bulgarian')) == true
  end

  test "has_general_information_for? should be false with no available field values" do
    assert has_general_information_for?(User.new) == false
  end

  #location_string_for
  test "location_string_for should return only city when only city is available" do
    assert location_string_for(User.new(city: 'Sofia')) == 'Sofia'
  end

  test "location_string_for should return only country when only country is available" do
    assert location_string_for(User.new(country: 'Bulgaria')) == 'Bulgaria'
  end

  test "location_string_for should return city and country when both are available" do
    assert location_string_for(User.new(city: 'Sofia', country: 'Bulgaria')) == 'Sofia, Bulgaria'
  end

  test "location_string_for should return empty string when nothing is available" do
    assert location_string_for(User.new) == ''
  end

end