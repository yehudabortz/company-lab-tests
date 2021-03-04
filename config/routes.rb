Rails.application.routes.draw do
  resources :users
  resources :tests
  resources :labs
  resources :companies

  namespace :admin do 
    resources :tests
  end

  namespace :company do 
    resources :users
  end


  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'


  get '/auth/google_oauth2'
  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'

  
  root 'static#welcome'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
