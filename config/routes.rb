Rails.application.routes.draw do
  resources :users
  resources :tests
  resources :labs
  resources :companies


  resources :sessions, only: [:create, :new, :destroy]
  get '/signup', to: 'users#new'
  get '/logout', to: 'sessions#destroy'
  get '/login', to: 'sessions#new'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
