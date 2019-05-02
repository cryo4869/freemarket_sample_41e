Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  #post "/purchase/(:id)/(pay)",to: "purchase#pay"
  resources :purchase, only: :index do
    member do
      post :new, to: "purchase#pay"
      get :new
      get :done
    end
  end
  resources :users do
    collection do
      get :signup
      get "card"
      get "card_create"
      post :add_card
    end
    member do
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
  resources :buys

end
