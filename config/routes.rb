Rails.application.routes.draw do
  get "home/index"
  root "home#index"
  resources :games
  resources :publishers
  resources :platforms
end
