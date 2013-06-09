require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  def setup
    @contact = contacts(:simple_user_profile_contact)
  end

  test "valid contact" do
    assert @contact.valid?, 'Default fixture should define a valid contact'
  end
end