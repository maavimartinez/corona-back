Rails.application.routes.draw do

  post   '/users',        to: 'users#create'
  get    '/users/:id',    to: 'users#show'
  patch  '/users/:id',    to: 'users#update'
  delete '/users/:id',    to: 'users#destroy'
  post   '/users/login',  to: 'users#login'
  resources :offers
  resources :reviews
  resources :products
  resources :shops
  resources :news
  resources :towns
  resources :cities
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
