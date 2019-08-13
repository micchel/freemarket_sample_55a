Rails.application.routes.draw do

  get 'card/new'
  get 'card/show'
  devise_for :users

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

  resources :items, only: [:new,:create,:show,:edit,:destroy] do
    collection do
      get "select", to: "items#select"
      get "select_grand", to: "items#select_grand"
      get "my_item/:id",to: "items#my_item"
      get "transaction/buy/:id", to: "items#buy_confirm"
    end
  end

  resources :signup do
    collection do
      get 'signup'
      get 'menber'
      get 'tel'
      get 'address'
      get 'done'
    end
  end
end