class HomeController < ApplicationController
  def index
    redirect_to mypage_url
  end
end
