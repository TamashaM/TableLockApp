require 'test_helper'

class DiningInformationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save dining information without restaurant_id" do
    dining_information = DinerInforamtion.new
    assert !dining_information.save
  end
end
