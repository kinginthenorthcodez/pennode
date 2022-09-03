Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :update, :create, :show, :edit, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create, :destroy]
    end
  end
end
