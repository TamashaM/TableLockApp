require 'test_helper'

class Diner::DinerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save diner without telephone" do
    diner = Diner.new
    assert !diner.save
  end
  test "should redirect to home" do
    diner = Diner.new
    assert !diner.save
    assert_redirected_to(:controller => "diner/home")
  end
  test "should not save diner without first_name" do
    diner = Diner.new
    assert !diner.save
  end
  test "should not save diner without user_id" do
    diner = Diner.new
    assert !diner.save
  end


end
