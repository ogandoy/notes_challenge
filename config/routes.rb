Rails.application.routes.draw do
  devise_for :users

  root 'home#index'
  resources :notes

  get 'home/dashboard', to: 'home#dashboard', as: 'dashboard'
end
