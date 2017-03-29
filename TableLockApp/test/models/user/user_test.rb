require 'test_helper'

class User::UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save user without email" do
    user=User.new
    assert !user.save
  end
  test "should not save user without password" do
    user=User.new
    assert !user.save
  end
end
