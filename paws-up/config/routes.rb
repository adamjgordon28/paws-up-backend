Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :pets
      resources :adopters, only: [:create]
      resources :meetings
      post '/login', to: 'auth#login' # sign in
      get '/profile', to: 'adopters#profile' # profile!
    end
  end


end
