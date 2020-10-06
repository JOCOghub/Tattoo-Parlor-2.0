Rails.application.routes.draw do

  resources :customers do
    resources :artists
  end

  resources :artists do
    resources :appointments
  end

  resources :customers do 
    resources :appointments
  end   

  resources :appointments

  get '/signup', to: "customers#new"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  post '/logout', to: "sessions#destroy"
  get "/auth/google_oauth2/callback", to: "sessions#create_with_google"
  root 'customers#home'



  # get '/', to: "artists#about"
  # get '/artists', to: "artists#index"
  # get '/artists/:id', to: "artists#show"
  # resources :artists, only: [:index, :new]

end