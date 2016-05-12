Rails.application.routes.draw do

  root "subreddits#index"
  
  get '/r/:name', to: 'subreddits#index'
  get 'sessions/new'

  resources :authorize
  resources :preferences
  resources :users
  
end
