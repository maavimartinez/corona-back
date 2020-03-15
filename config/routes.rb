Rails.application.routes.draw do
  resources :products
  resources :shops
  resources :news
  resources :towns
  resources :cities
  resources :posts
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
