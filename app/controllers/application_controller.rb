class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :store_jwt, if: :devise_controller? # TODO: ここは before_action or after_actionのどちらにすべきかよう確認

  protected

  def configure_permitted_parameters
    added_attrs = %i[username email password password_confirmation remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def store_jwt
    cookies[:cart_user_info] = if current_user
                                 {
                                   value: current_user.user_info.to_json, path: "/", domain: :all
                                 }
                               else
                                 { # cookieを削除するとsafariの場合は、サブドメインであるshop側のcookieが残ってしまうので、削除ではなくて、更新とした
                                   value: "{}", path: "/", domain: :all
                                 }
                               end
  end
end
