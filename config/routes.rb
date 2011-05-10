Pixtr::Application.routes.draw do

  resources :galleries do
    resources :photos
  end

  root :to => "application#index"
  
end
