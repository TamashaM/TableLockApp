require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save without telephone" do
    restaurant = Restaurant.new
    restaurant.user_id="298486374"
    restaurant.first_name="test"
    restaurant.last_name="testlast"
    restaurant.position=1
    restaurant.city="test"
    restaurant.add_line1="test"
    restaurant.province="test"
    restaurant.restaurant_name="test"


    assert !restaurant.save
  end
  test "should not save without first_name" do
    restaurant = Restaurant.new
    restaurant.user_id="298486374"
    restaurant.telephone="test"
    restaurant.last_name="testlast"
    restaurant.position=1
    restaurant.city="test"
    restaurant.add_line1="test"
    restaurant.province="test"
    restaurant.restaurant_name="test"


    assert !restaurant.save
  end
  test "should not save without last_name" do
    restaurant = Restaurant.new
    restaurant.user_id="298486374"
    restaurant.telephone="test"
    restaurant.first_name="testlast"
    restaurant.position=1
    restaurant.city="test"
    restaurant.add_line1="test"
    restaurant.province="test"
    restaurant.restaurant_name="test"


    assert !restaurant.save
  end
  test "should not save without position" do
    restaurant = Restaurant.new
    restaurant.user_id="298486374"
    restaurant.telephone="test"
    restaurant.first_name="testlast"
    restaurant.last_name="testlast"
    restaurant.city="test"
    restaurant.add_line1="test"
    restaurant.province="test"
    restaurant.restaurant_name="test"


    assert !restaurant.save
  end
  test "should not save without city" do
    restaurant = Restaurant.new
    restaurant.user_id="298486374"
    restaurant.telephone="test"
    restaurant.first_name="testlast"
    restaurant.last_name="testlast"
    restaurant.position=1
    restaurant.add_line1="test"
    restaurant.province="test"
    restaurant.restaurant_name="test"


    assert !restaurant.save
  end
  test "should not save without province" do
    restaurant = Restaurant.new
    restaurant.user_id="298486374"
    restaurant.telephone="test"
    restaurant.first_name="testlast"
    restaurant.last_name="testlast"
    restaurant.position=1
    restaurant.add_line1="test"
    restaurant.city="test"
    restaurant.restaurant_name="test"


    assert !restaurant.save
  end
  test "should not save without restaurant_name" do
    restaurant = Restaurant.new
    restaurant.user_id="298486374"
    restaurant.telephone="test"
    restaurant.first_name="testlast"
    restaurant.last_name="testlast"
    restaurant.position=1
    restaurant.add_line1="test"
    restaurant.province="test"
    restaurant.city="test"


    assert !restaurant.save
  end
  test "should save" do
    restaurant = Restaurant.new
    restaurant.user_id="298486374"
    restaurant.telephone="test"
    restaurant.first_name="testlast"
    restaurant.last_name="testlast"
    restaurant.position=1
    restaurant.add_line1="test"
    restaurant.province="test"
    restaurant.city="test"
    restaurant.restaurant_name="test"


    assert !restaurant.save
  end
end
