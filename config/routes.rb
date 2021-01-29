Rails.application.routes.draw do
  get 'logout' => 'sessions#destroy', :as => 'logout'
  get 'login' => 'sessions#new', :as => 'login'
  get 'signup' => 'users#new', :as => 'signup'
  get 'perfil(.:id)', to: 'users#show', as: :perfil_user
  patch 'perfil(.:id)', to: 'users#update', as: :update_perfil_user
  get 'edit', to: 'users#edit', as: :edit_user
  post 'edit', to: 'users#update'
  get 'usuarios', to: 'users#index', as: :usuarios
  post 'watchlist', to: 'watchlist#create', as: :watchlist
  delete 'watchlist', to: 'watchlist#destroy'
  resources :users
  resources :sessions
  resources :movies
  resources :genres
  root 'application#homepage'
  get 'new_review/:movie_id', to: 'reviews#new', as: :nova_review
  post 'new_review/:movie_id', to: 'reviews#create'
  get 'edit_review/:movie_id/:id', to: 'reviews#edit', as: :editar_review
  patch 'edit_review/:movie_id/:id', to: 'reviews#update'
  delete 'delete_review/:id', to: 'reviews#destroy', as: :delete_review
  get 'sorted', to: 'movies#sorted', as: :surto
end