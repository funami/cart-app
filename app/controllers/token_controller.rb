class TokenController < ApplicationController
  after_action :store_jwt
  def index
    if current_user
      store_jwt
      response.headers['Access-Control-Allow-Credentials'] = true
      render status: 200, json: current_user.user_info
    else
      response_unauthorized
    end
  end

  private

  # 401 Unauthorized
  def response_unauthorized
    render status: 401, json: { error: 'Unauthorized' }
  end
end
