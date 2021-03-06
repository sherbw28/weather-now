Rails.application.routes.draw do
 root to: "weathers#index"   
  
 resources :weathers
 get "signup", to: "users#new"
 
 get "login", to: "sessions#new"
 post "login", to: "sessions#create"
 delete "logout", to: "sessions#destroy"
 
 resources :users, only: [:index, :show, :new, :create, :edit, :update]
end
