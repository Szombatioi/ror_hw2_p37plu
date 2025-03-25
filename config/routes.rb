Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  # get 'index/home'
  root "index#home"

  resources :lands do
    resources :records
  end

  # get "lands/:name", to: "lands#show", as: :land
  # get "lands/:name/:id", to: "records#show", as: :record

  # # resources :lands, only: [:new, :create, :show, :index]
  
  # resources :lands, only: [:new, :create, :show, :index, :edit, :update] do
  #   resources :records, only: [:new, :create]
  # end
  # post "lands/new", to: "lands#new"
  # post "lands/:id/records/new", to: "records#new"
  # put "lands/:id/edit", to: "lands#edit"

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
