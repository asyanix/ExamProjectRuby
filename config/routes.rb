Rails.application.routes.draw do
  get "home/index"
  root "home#index"
  resources :games
  resources :publishers do
    member do
      get :games
    end
  end  
  resources :platforms do
    member do
      get :games
    end
  end
  
end
