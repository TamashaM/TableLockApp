require 'test_helper'

class Diner::DinerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save diner without telephone" do
    diner = Diner.new
    diner.user_id=100
    diner.first_name="test"
    diner.last_name="testlast"
    assert !diner.save
  end
  test "should redirect to home" do
    diner = Diner.new
    assert !diner.save

  end
  test "should not save diner without first_name" do
    diner = Diner.new
    diner.last_name="testlast"
    diner.telephone="0775480379"
    assert !diner.save
  end
  test "should not save diner without user_id" do
    diner = Diner.new
    assert !diner.save
  end
  test "should not save diner" do
    diner = Diner.new

    diner.first_name="test"
    diner.last_name="testlast"
    diner.telephone="0775480379"
    diner.created_at="2017-05-01 16:07:00"
    diner.updated_at="2017-05-01 16:07:00"
    assert !diner.save
  end





end
