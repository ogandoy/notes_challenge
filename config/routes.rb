Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:index] do
    member do
      patch :update_role
    end
  end

  root 'home#index'
  resources :notes

  get 'home/dashboard', to: 'home#dashboard', as: 'dashboard'
end
