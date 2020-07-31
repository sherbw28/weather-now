Rails.application.routes.draw do
 root to: "weathers#index"   
    
 resources :weathers
end
