Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show] do
    resources :producer, only: [:new, :create]
    resources :editors, only: [:new, :create]
  end

  resources :producers, only: [:edit, :show, :update, :destroy]
  # Defines the root path route ("/")
  # root "articles#index"
  resources :editors, only: [:edit, :show, :index, :update, :destroy]
end
