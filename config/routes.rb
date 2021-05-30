Rails.application.routes.draw do
  resources :meal_plan_recipes
  resources :meal_plans
  resources :recipes
  resources :users
  resources :sessions, only: [:create, :index]
  get '/recipes_search/', to: 'recipes#search', as: :search
end
