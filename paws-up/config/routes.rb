Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :pets
      resources :adopters
      resources :meetings
    end
  end
end
