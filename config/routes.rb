Rails.application.routes.draw do
  root to: "pictures#index"
  resources :users
end
