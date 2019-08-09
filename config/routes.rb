Rails.application.routes.draw do

  root to: "items#index"
  
  resources :mypage, only: [:index,:edit]do
    collection do
      get "profile", to: "mypage#profile"
      get "card", to: "mypage#card"
      get "information", to: "mypage#information"
      get "logout", to: "mypage#logout"
      get "list", to: "mypage#list"
      
    end
  end

  resources :items, only: [:new,:show,:destroy] do
    collection do
      get "my_item/:id",to: "items#my_item"
      get "sell/edit/:id", to: "items#edit_item"
      get "transaction/buy/:id", to: "items#buy_confirm"
    end
  end
end
