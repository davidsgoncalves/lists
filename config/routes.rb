Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #
  resources :items
  resources :bills
  resources :wallets

  root 'items#index'
end
