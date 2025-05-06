class UsersController < ApplicationController
  def show
    @user = current_user
    @live_records = @user.live_records.order(date: :desc)
  end
end
