require 'test_helper'

class Auth::LoginControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "should get login" do
    get :'/login'
    assert_response :success
    assert_not_nil assigns(:session)
  end
end
