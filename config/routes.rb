Rails.application.routes.draw do
  get 'users/index'
  get 'users/new'
  get 'users/show'
  get 'users/create'
 root to: "weathers#index"   
    
 resources :weathers
 get "signup", to: "users#new"
 resources :users, only: [:index, :show, :new, :create]
end
