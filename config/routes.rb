Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # pundit to: "pages#home/unauthorized"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show] do
    resources :producers, only: [:new]
    resources :editors, only: [:new]
  end

  resources :books
  resources :authors, only: [:index, :show, :create]
  resources :producers, only: [:edit, :show, :update, :destroy, :create]
  # Defines the root path route ("/")
  # root "articles#index"
  resources :editors, only: [:create, :edit, :show, :index, :update, :destroy]
end
