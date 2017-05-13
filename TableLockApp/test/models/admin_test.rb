require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save admin without telephone" do
    admin = Admin.new
    admin.user_id=100
    admin.first_name="test"
    admin.last_name="testlast"

    assert !admin.save
  end
  test "should redirect to home" do
    admin = Admin.new
    assert !admin.save


  end
  test "should not save admin without first_name" do
    admin = Admin.new
    admin.last_name="testlast"
    admin.telephone="0775480379"
    assert !admin.save
  end
  test "should not save admin without user_id" do
    admin = Admin.new
    assert !admin.save
  end
  test "should not save admin" do
    admin = Admin.new
    admin = Admin.new

    admin.first_name="test"
    admin.last_name="testlast"
    admin.telephone="0775480379"
    admin.created_at="2017-05-01 16:07:00"
    admin.updated_at="2017-05-01 16:07:00"
    assert !admin.save
  end
end
