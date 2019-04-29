Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  resources :users do
    collection do
      get :signup
      get "card"
      get "card_create"
      post :add_card
      get :mypage
    end
  end
  root 'products#index'
  resources :products do
    get 'shipping_method', on: :collection
    get 'category_middle', on: :collection
    get 'category_bottom', on: :collection
    get 'search', on: :collection
  end
<<<<<<< HEAD
  resources :buys
  resources :purchase do
    member do
      post :pay
    end
=======
  resources :buys do
    get :purchase, on: :member
>>>>>>> master
  end
end
