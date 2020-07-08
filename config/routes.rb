Rails.application.routes.draw do
  root 'static_pages#home'
  get '/signup',               to: 'users#new'
  get '/login',                to: 'sessions#new'
  post '/login',               to: 'sessions#create'
  delete '/logout',            to: 'sessions#destroy'
  get '/hospital_login',       to: 'hospital_sessions#new'
  post '/hospital_login',      to: 'hospital_sessions#create'
  delete '/hospital_logout',   to: 'hospital_sessions#destroy'
  get '/search',               to: 'items#search'
  post '/search',              to: 'items#update'
  resources :users
  resources :hospitals
  resources :hospital_items, only: [:show]
  resources :items, only: [:show]
end
