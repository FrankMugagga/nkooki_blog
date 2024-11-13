Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root to: "users#index", as: :authenticated_root
    end

    unauthenticated :user do
      root to: "devise/sessions#create", as: :unauthenticated_root
    end
  end

  resources :users do
    resources :posts do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create]
    end
  end

  resources :posts, only: [:index]

end
