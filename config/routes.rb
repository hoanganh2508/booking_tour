Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  root "static_pages#home"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :user_tours
  resources :tours do
    resources :reviews
    resources :user_like_tours
    resources :user_rating_tours
  end
  resources :search_tours, only: [:index]
  resources :categories
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :my_tours
  resources :comments, only: [:create, :destroy]

  namespace :admin do
    root "dash_board#index"
    resources :dash_board, only: :index
    resources :tours
    resources :categories
    resources :users
    resources :user_tours

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
