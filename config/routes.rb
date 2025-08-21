Rails.application.routes.draw do
  resources :clubs do
    collection do
      get :search
    end
  end
  resources :documents
                get "board/index"
              # Articles routes
              get "news", to: "articles#index"
              resources :articles, path: "news"
              
              # Brackets routes
              get "brackets", to: "brackets#index"
  
  # Authentication routes
  get "signin", to: "sessions#new"
  post "signin", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "logout", to: "sessions#destroy"
  
  # Registration routes
  get "signup", to: "registrations#new"
  post "signup", to: "registrations#create"
  
  # Dashboard routes
  get "dashboard", to: "dashboard#index", as: :dashboard
  get "profile/edit", to: "dashboard#edit_profile", as: :edit_user_profile
  patch "profile", to: "dashboard#update_profile", as: :update_user_profile
  get "profile/change-password", to: "dashboard#change_password", as: :change_password
  patch "profile/change-password", to: "dashboard#update_password", as: :update_password
  
  # Admin routes
  namespace :admin do
    resources :users
    get "dashboard", to: "dashboard#index", as: :dashboard
  end
  
  # Main routes
  get "home/index"
  get "board", to: "board#index"
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "home#index"
end
