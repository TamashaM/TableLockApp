require 'test_helper'

class DinersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @diner = diners(:one)
  end

  # test "should get index" do
  #   get 'diner/index'
  #   assert_response :success
  # end
  #
  # test "should get new" do
  #   get new_diner_url
  #   assert_response :success
  # end
  #
  # test "should create diner" do
  #   assert_difference('Diner.count') do
  #     post diners_url, params: { diner: {  } }
  #   end
  #
  #   assert_redirected_to diner_url(Diner.last)
  # end

  # test "should show diner" do
  #   session[:diner_id]="298486374"
  #   session[:user_id]="298486374"
  #   get 'diner/profile'
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get edit_diner_url(@diner)
  #   assert_response :success
  # end

  # test "should update diner" do
  #   patch diner_url(@diner), params: { diner: {  } }
  #   assert_redirected_to diner_url(@diner)
  # end

  # test "should destroy diner" do
  #   assert_difference('Diner.count', -1) do
  #     delete diner_url(@diner)
  #   end
  #
  #   assert_redirected_to diners_url
  # end
  test "should get login" do
    get :'/diner/profile'
    !assert_response :success
    !assert_not_nil assigns(:session)
  end
end
