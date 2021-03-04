Rails.application.routes.draw do
  resources :users
  resources :tests
  resources :labs
  resources :companies


  resources :sessions, only: [:create, :new, :destroy]
  get '/signup', to: 'users#new'
  get '/logout', to: 'sessions#destroy'
  get '/login', to: 'sessions#new'


  get '/auth/google_oauth2'
  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'

  
  root 'static#welcome'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
