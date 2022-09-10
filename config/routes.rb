Rails.application.routes.draw do
  namespace :api, constraints: { format: :json } do
    namespace :admin do
      namespace :v1 do
        resources :frames
        resources :lenses
      end
    end
  end
end
