require 'test_helper'

class OfferTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save offer without restaurant_id" do
    offer = Offer.new
    offer.name="test"
    assert !offer.save
  end
  test "should not save offer without name_id" do
    offer = Offer.new
    offer.restaurant_id="298486374"
    assert !offer.save
  end
  test "should save with restaurant_id and name" do
    offer=Offer.new
    offer.name="test"
    offer.restaurant_id="298486374"
    assert offer.save
  end

end
