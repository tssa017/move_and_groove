require "test_helper"

class UserInfoControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get user_info_show_url
    assert_response :success
  end
end
