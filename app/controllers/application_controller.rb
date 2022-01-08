class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :store_jwt, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = %i[username email password password_confirmation remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def store_jwt
    if current_user
      cookies[:firebase_custom_token] = {
        value: current_user.firebase_custom_token, path: "/"
      }
    else
      cookies.delete :firebase_custom_token
    end
  end
end
