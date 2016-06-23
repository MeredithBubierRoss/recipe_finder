Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  resources :recipes, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :ingredients, only: [:index, :show, :search]
  resources :users, only: [:show]
  resources :favorite_recipes, only: [:create, :destroy]

end
