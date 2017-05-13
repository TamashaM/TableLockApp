require 'test_helper'

class NotificationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save notificatio without user_id" do
    notification = Notification.new
    assert !notification.save
  end
  test "should save with only user_id" do
    notification=Notification.new
    notification.user_id="298486374"
    assert notification.save
  end
end

