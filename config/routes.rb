Rails.application.routes.draw do
  root to: 'main#index'

  resources :osago_calculators
end
