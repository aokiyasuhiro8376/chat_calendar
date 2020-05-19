Rails.application.routes.draw do
  root 'events#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  # , only: [:index, :show]
  resources :rooms
  # , only: [:index, :show, :create, :destroy]
  # resources :direct_messages, only: [:create]
  resources :events
end
