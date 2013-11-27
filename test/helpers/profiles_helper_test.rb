require 'test_helper'

class ProfilesHelperTest < ActionView::TestCase

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

end