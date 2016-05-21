Rails.application.routes.draw do
  resources :mechanic_profiles
  resources :mechanic_searches
  resources :inspections
  resources :mechanics
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
