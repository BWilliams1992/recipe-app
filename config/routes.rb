Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "welcome#home"
  resources :recipes
  resources :users, only: [:show, :index]
  resources :collections
  post 'recipes/:id', to: 'recipes#add_to_collection'
end
