Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items
  resources :users, only: [:edit, :update]
  resources :orders, only: [:new, :create]
end
