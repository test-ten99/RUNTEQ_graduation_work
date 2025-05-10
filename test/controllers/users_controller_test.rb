require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
   def setup
    User.delete_all # 既存のユーザーを削除
  end

  test "should get show" do
    get users_show_url
    assert_response :success
  end
end
