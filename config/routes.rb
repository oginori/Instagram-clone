Rails.application.routes.draw do
  get 'pictures/index'
  root to: "pictures#index"
  resources :users
end
