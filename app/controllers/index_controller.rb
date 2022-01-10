class IndexController < ApplicationController
  def letsencrypt
    render text: ENV["LETSENCRYPT_RESPONSE"] if params[:id] == ENV["LETSENCRYPT_REQUEST"]
  end
end
