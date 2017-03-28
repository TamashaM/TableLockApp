require 'test_helper'

class Diner::DinerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "invalid without a telephone" do
    d=Diner.new
    assert !d.valid?, "Name is not being validated"
  end
end
