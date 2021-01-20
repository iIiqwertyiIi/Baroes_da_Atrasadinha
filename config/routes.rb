Rails.application.routes.draw do
  get 'logout' => 'sessions#destroy', :as => 'logout'
  get 'login' => 'sessions#new', :as => 'login'
  get 'signup' => 'users#new', :as => 'signup'
  resources :users
  resources :sessions
  resources :movies
  resources :reviews
  root 'application#homepage'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end