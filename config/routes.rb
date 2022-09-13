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
      resources :sessions, only: [:create]
      resources :frames, only: [:index]
      resources :lenses, only: [:index]
      resources :glasses, only: [:new, :index, :create]
    end
  end
end
