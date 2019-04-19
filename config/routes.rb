Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'
  devise_for :users
  resources :users do
    collection do
      get :signup
    end
  end
  resources :products
  resources :sells do
    get 'shipping_method', on: :collection
    get 'category_middle', on: :collection
    get 'category_bottom', on: :collection
  end
  resources :buys
end
