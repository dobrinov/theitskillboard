require 'test_helper'

class InterestTest < ActiveSupport::TestCase

  def setup
    @programming_interest = interests(:programming)
    @ux_interest          = interests(:ux)
    @startups_interest    = interests(:startups)
  end

  test "valid interest" do
    assert @programming_interest.valid?, 'The default fixture should define a valid interest'
  end
end