Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "welcome#home"
  resources :recipes
  resources :users, only: [:show, :index, :destroy]
  resources :collections
  resources :articles do
    resources :comments
  end
  post 'recipes/:id', to: 'recipes#add_to_collection'
  post 'collections/:id', to: 'collections#remove_from_collection'
end
