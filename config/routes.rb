Rails.application.routes.draw do
  resources :mechanic_profiles
  resources :mechanic_searches
  resources :inspections
  resources :mechanics do
    member do
      get 'approve'
    end
    collection do
      get 'unapproved'
    end
  end
  root to: 'visitors#index'
  #devise_for :users
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  resources :users
  
  get 'users/:id/set_admin' => 'users#set_admin'
end
