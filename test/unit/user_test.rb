require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = users(:simple_user)
  end

  test "valid user" do
    assert @user.valid?, 'The default fixture should define a valid user'
  end

end