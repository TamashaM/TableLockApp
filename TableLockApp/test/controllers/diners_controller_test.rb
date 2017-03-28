require 'test_helper'

class DinersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @diner = diners(:one)
  end

  test "should get index" do
    get diners_url
    assert_response :success
  end

  test "should get new" do
    get new_diner_url
    assert_response :success
  end

  test "should create diner" do
    assert_difference('Diner.count') do
      post diners_url, params: { diner: {  } }
    end

    assert_redirected_to diner_url(Diner.last)
  end

  test "should show diner" do
    get diner_url(@diner)
    assert_response :success
  end

  test "should get edit" do
    get edit_diner_url(@diner)
    assert_response :success
  end

  test "should update diner" do
    patch diner_url(@diner), params: { diner: {  } }
    assert_redirected_to diner_url(@diner)
  end

  test "should destroy diner" do
    assert_difference('Diner.count', -1) do
      delete diner_url(@diner)
    end

    assert_redirected_to diners_url
  end
end
