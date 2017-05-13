require 'test_helper'

class MealTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save meal type without restaurant_id" do
    meal_type = MealType.new
    assert !meal_type.save
  end
  test "should save with only restaurant_id" do
    meal_type=MealType.new
    meal_type.restaurant_id="298486374"
    assert meal_type.save
  end
end
