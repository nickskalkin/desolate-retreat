Rails.application.routes.draw do
  root to: 'main#index'
  get 'coefficients', to: 'main#coefficients'

  devise_for :users, controllers: {
    registrations: 'custom_registrations',
    sessions: 'custom_sessions'
  }

  resources :osago_calculators
  resources :users
  resources :policies
end
