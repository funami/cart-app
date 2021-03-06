class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def user_info
    { id: id.to_s, username: username, token: custom_token(id) }
  end

  private

  def custom_token(uid)
    service_account_email = Rails.application.credentials.config[:firebase_service_account_email]
    private_key = OpenSSL::PKey::RSA.new Rails.application.credentials.config[:firebase_private_key]
    now_seconds = Time.now.to_i
    payload = { iss: service_account_email,
                sub: service_account_email,
                aud: "https://identitytoolkit.googleapis.com/google.identity.identitytoolkit.v1.IdentityToolkit",
                iat: now_seconds,
                exp: now_seconds + 60, # Maximum expiration time is one minits
                uid: uid }
    JWT.encode payload, private_key, "RS256"
  end
end
