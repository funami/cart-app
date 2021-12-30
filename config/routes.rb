Rails.application.routes.draw do
  root "home#index"
  get "/mypage", to: "mypage#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
