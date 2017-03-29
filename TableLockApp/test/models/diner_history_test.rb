require 'test_helper'

class DinerHistoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save diner history without diner_id" do
    diner_history = DinerHistory.new
    assert !diner_history.save
  end
end
