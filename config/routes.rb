Rails.application.routes.draw do
  root 'rooms#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :rooms, only: [:index, :show]
  resources :users, only: [:index, :show]
  resources :events, only: [:index, :new, :show, :edit]

  # get '/rooms/:id', to: 'rooms#show'
end

# '/rooms/', to: 'rooms#index'
# devise_for :users



