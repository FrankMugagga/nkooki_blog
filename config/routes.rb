Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root to: "users#index", as: :authenticated_root
    end

    unauthenticated :user do
      root to: "splash#index", as: :unauthenticated_root
    end
  end

  resources :users

  get 'splash/index', as: :splash
end
