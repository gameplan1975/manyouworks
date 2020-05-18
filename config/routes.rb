Rails.application.routes.draw do
  resources :labels
  resources :tasks
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  root to: "tasks#index"
  get 'sessions/new'
  get "search" => "tasks#search"
  namespace :admin do
    resources :users
  end
end
