# mypageの表示
class MypageController < ApplicationController
  before_action :check_signed_in
  after_action :store_jwt, only: %i[index]

  def check_signed_in
    redirect_to new_user_session_path unless signed_in?
  end

  def index
    @user = current_user
  end
end
