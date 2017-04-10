require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "should create user" do
    assert_difference('User.count') do
      user :create, user: {email: @user.email, password: @user.password}
    end
    assert_redirected_to user_path(assigns(:user))
  end
end
