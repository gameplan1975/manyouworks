Rails.application.routes.draw do
  resources :tasks
  resources :users
  root to: "tasks#index"
  get "search" => "tasks#search"
end
