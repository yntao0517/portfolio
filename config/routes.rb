Rails.application.routes.draw do
  root 'static_pages#home'
  get '/signup',              to: 'users#new'
  get '/login',               to: 'sessions#new'
  post '/login',               to: 'sessions#create'
  delete '/logout',            to: 'sessions#destroy'
  resources :users
  resources :hospitals, only: [:new] do
    get '/signup',            to: 'hospitals#new'
  end
end
