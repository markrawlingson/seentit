Rails.application.routes.draw do

  root "home#index"
  
  get '/r/:name', to: 'subreddits#index'
  get 'sessions/new'

  resources :preferences
  resources :users
  
end
