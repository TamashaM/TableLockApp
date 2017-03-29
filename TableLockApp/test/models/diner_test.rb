require 'test_helper'

class DinerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save diner without telephone" do
    diner = Diner.new
    assert !diner.save
  end
end
