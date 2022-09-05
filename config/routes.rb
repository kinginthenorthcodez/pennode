Rails.application.routes.draw do
  use_doorkeeper do
    skip_controllers :authorizations, :applications, :authorized_applications
  end
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

## API endpoints  , :defaults => { :format => :json} 
  namespace :api, defaults: { format: 'json' } do #/api
    namespace :v1 do #/api/v1
      resources :users, only: [] do #/api/v1/users
        resources :posts, only: [:index, :show] do  #/api/v1/users/posts   note: /api/v1/users/:user_id/posts(.:format)
          resources :comments, only: [:index, :create] #/api/v1/users/posts/comments    note: users => user_id, posts => posts_id
        end
      end
    end
  end

end
