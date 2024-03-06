Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  root to: "pages#home"

  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  devise_scope :user do
    get 'profile', to: 'users/sessions#show'
  end

  resources :activities, only: [:index, :show] do
    resources :saves
  end

  resources :proposals, only: [:new, :create] do
    resources :likes, only: [:create]
  end

  resources :events, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :attendances, only: [:create]
  end

  resources :groups do
    resources :memberships, only: [:new, :create, :destroy]
  end
end
