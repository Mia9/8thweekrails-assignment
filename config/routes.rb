Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "events#index"
  resources :events
  resources :users, only: [:show, :edit, :destroy]
  post "/users/:id", to: "users#show", as: "show_user"
end
