Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  get "/mypage", to: "mypage#index"
  get "/token", to: "token#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
