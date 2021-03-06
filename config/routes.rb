Rails.application.routes.draw do
  get 'sessions/new'
  resources :tasks
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  root to: "tasks#index"
  get "search" => "tasks#search"
  namespace :admin do
    resources :users
  end
end
