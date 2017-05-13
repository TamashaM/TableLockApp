require 'test_helper'

class HolidayTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save holiday without restaurant_id" do
    holiday = Holiday.new
    assert !holiday.save
  end
  test "should save with only restaurant_id" do
    holiday=Holiday.new
    holiday.restaurant_id="298486374"
    assert holiday.save
  end
end

