Rails.application.routes.draw do
  get '/tests/registration', to: 'tests#new_registration'
  post '/tests/registration', to: 'tests#register'

  resources :users do
    post :deactivate, on: :member
  end

  resources :companies, :labs
  resources :tests, only: [:show, :destroy]
  resources :company_lab_connections, except: [:show]

  resources :users do
    resources :tests, except: [:edit]
  end
  
  namespace :admin do 
    resources :tests
    resources :users, except: [:edit, :update]
    resources :users do
      resources :tests, only: [:create]
    end
  end


  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'


  get '/auth/google_oauth2'
  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'

  match '/404', to: 'errors#not_found', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
  
  root 'sessions#new'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
