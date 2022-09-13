Rails.application.routes.draw do
  devise_for :users
  namespace :api, constraints: { format: :json } do
    namespace :admin do
      namespace :v1 do
        resources :frames, only: [:index, :create]
        resources :lenses, only: [:index, :create]
      end
    end

    namespace :v1 do
      resources :frames, only: [:index]
      resources :lenses, only: [:index]
      resources :glasses, only: [:new, :index, :create]
      post 'signin',         controller: :sessions,         action: :create
      post 'signup',         controller: :registrations,    action: :create
    end
  end
end
