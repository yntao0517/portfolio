Rails.application.routes.draw do
  root 'static_pages#home'
  get '/about',                to: 'static_pages#about'
  get '/signup',               to: 'users#new'
  get '/login',                to: 'sessions#new'
  post '/login',               to: 'sessions#create'
  delete '/logout',            to: 'sessions#destroy'
  get '/hospital_login',       to: 'hospital_sessions#new'
  post '/hospital_login',      to: 'hospital_sessions#create'
  delete '/hospital_logout',   to: 'hospital_sessions#destroy'
  get '/search',               to: 'items#search'
  post '/support_users',       to: 'support_lists#users'
  post '/user_pay',            to: 'pays#pay'
  get '/pay_fin',              to: 'pays#pay_fin'
  resources :users
  resources :hospitals
  resources :password_changes, only: [:edit, :update]
  resources :hospital_password_changes, only: [:edit, :update]
  resources :pays, only: [:show]
  resources :hospital_items, only: [:show]
  resources :support_lists, only: [:show]
  resources :items, only: [:show] do
    member do
      post '/shortage',            to: 'items#shortage'
      post '/support',             to: 'items#support'
      post '/delete',              to: 'items#delete', params: :hospital_item
    end
  end
end
