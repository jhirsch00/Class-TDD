Pixtr::Application.routes.draw do
  
  resources :galleries
  resources :users

  root :to => "application#index"
  
end
