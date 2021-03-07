Rails.application.routes.draw do
  get '/tests/registration', to: 'tests#new_registration'
  post '/tests/registration', to: 'tests#register'

  resources :users, :tests, :companies, :labs
  # resources :users, :tests, :labs, :companies

  resources :users do
    resources :tests
  end
  
  namespace :admin do 
    resources :tests
    resources :users
  end


  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'


  get '/auth/google_oauth2'
  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'

  
  root 'static#welcome'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
