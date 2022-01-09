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
      cookies[:cart_user_info] = {
        value: current_user.user_info.to_json, path: "/", domain: ".a.com"
      }
    else
      cookies.delete :firebase_custom_token
    end
  end
end
