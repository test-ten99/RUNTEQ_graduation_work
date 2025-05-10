require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
   def setup
    User.delete_all # 既存のユーザーを削除
    @unique_email = "test_#{SecureRandom.hex(10)}@example.com" # ランダムなメールアドレス
    @user = User.create!(email: @unique_email, password: "password") # ユーザーを作成
  end

  test "should get show" do
    get users_show_url(@user) # ユーザーのIDを渡す
    assert_response :success
  end
end
