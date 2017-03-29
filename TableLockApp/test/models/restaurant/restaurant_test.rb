require 'test_helper'

class Restaurant::RestaurantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save restaurant without restaurant_name" do
    restaurant = Restaurant.new
    assert !restaurant.save
  end
  test "should not save restaurant without telephone" do
    restaurant = Restaurant.new
    assert !restaurant.save
  end
end
