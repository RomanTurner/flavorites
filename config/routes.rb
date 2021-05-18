Rails.application.routes.draw do
  resources :users
  resources :sessions, only: [:create]
end
