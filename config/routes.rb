Rails.application.routes.draw do
  resources :users, :tests, :labs, :companies


  namespace :admin do 
    resources :tests
  end

  # namespace :company do 
  #   resources :users
  # end

  # nested routes for signup of certain company
  # /companies/1/users/signup


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
