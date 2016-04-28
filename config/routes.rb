Rails.application.routes.draw do
  root to: 'main#index'
  get 'coefficients', to: 'main#coefficients'

  resources :osago_calculators
end
