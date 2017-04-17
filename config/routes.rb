Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :guests
  resources :episodes
  resources :appearances, only: :create
  resources :users, only: :create

  root to: "sessions#new", as: :login
  post '/sessions', to: "sessions#create", as: :create_session
  delete 'sessions', to: 'sessions#destroy', as: :logout
  get '/sign-up', to: 'users#new', as: :sign_up
end
