Rails.application.routes.draw do
  # auth routes
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    passwords: "users/passwords"
  }

  get "up" => "rails/health#show", as: :rails_health_check

  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # api routes
  namespace :api do
    namespace :v1 do
      resources :users, only: [] do
        resources :events, only: [ :index ]
      end
    end
  end

  resources :events

  # Defines the root path route ("/")
  root "events#index"
end
