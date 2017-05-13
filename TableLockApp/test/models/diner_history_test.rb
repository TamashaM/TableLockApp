require 'test_helper'

class DinerHistoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save diner history without diner_id" do
    diner_history = DinerHistory.new
    assert !diner_history.save
  end
  test "should save with only diner_id" do
    diner_history=DinerHistory.new
    diner_history.diner_id="298486374"
    assert diner_history.save
  end

end
