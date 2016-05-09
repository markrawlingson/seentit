Rails.application.routes.draw do

  root "home#index"
  
  get 'sessions/new'

  resources :preferences
  resources :users
  
end
