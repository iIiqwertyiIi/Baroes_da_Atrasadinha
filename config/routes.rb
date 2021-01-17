Rails.application.routes.draw do
  get 'logout' => 'sessions#destroy', :as => 'logout'
  get 'login' => 'sessions#new', :as => 'login'
  get 'signup' => 'users#new', :as => 'signup'
  resources :users
  resources :sessions
  root 'application#homepage'
  #get 'movies', to: 'movies#index', :as => 'movie_index'
  #get 'movies', to: 'movies#create', :as => 'movie_create'
  resources :movies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end