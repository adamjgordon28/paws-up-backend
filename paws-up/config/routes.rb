Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :pets
      resources :adopters
      resources :meetings
      post "/login", to: "auth#login"
    end
  end


end
