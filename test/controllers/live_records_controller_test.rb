require "test_helper"

class LiveRecordsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get live_records_new_url
    assert_response :success
  end

  test "should get create" do
    get live_records_create_url
    assert_response :success
  end
end
