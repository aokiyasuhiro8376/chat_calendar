Rails.application.routes.draw do
  root 'rooms#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show]
  resources :direct_messages, only: [:create]
  resources :rooms, only: [:index, :show, :create, :destroy]
  resources :events
end

# devise_for :users
# resources :users, :only => [:index, :show]
# root "users#index"
# resources :direct_messages, :only => [:create]
# resources :rooms, :only => [:index, :show, :create, :destroy]
