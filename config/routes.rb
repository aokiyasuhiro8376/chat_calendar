Rails.application.routes.draw do
  devise_for :users
  root 'rooms#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :rooms, only: [:index, :show]
  resources :users, only: [:index, :show]
  resources :events
  # , only: [:index, :new, :show, :edit, :destroy]

  # get '/rooms/:id', to: 'rooms#show'
  # # get 'events', to: 'events#index'
  # post '/events', to: 'events#index'
  # delete '/events/:id', to: 'events#destroy'

end




