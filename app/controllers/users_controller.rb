class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @live_records = @user.live_records.order(date: :desc)
  end
end
