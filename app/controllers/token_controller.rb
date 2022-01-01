class TokenController < ApplicationController
  def index
    if current_user
      render status: 200, json: {
        id: current_user.id,
        username: current_user.username,
        firebase_custom_token: current_user.firebase_custom_token
      }
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
