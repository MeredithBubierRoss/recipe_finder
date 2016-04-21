Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  resources :recipes, only: [:index, :show]
  resources :ingredients, only: [:index, :show, :search]

end
