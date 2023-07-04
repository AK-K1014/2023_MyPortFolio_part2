Rails.application.routes.draw do
  root "top#home"
  get  "top/home"
  post '/users', to: 'users#create'
  get  '/users', to: 'users#show'
  get  '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  resources :users
end
