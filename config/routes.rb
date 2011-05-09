Pixtr::Application.routes.draw do
  
  resources :galleries

  root :to => "application#index"
  
end
