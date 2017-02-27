require 'test_helper'

class DinerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get diner_index_url
    assert_response :success
  end

end
