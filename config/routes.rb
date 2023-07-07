Rails.application.routes.draw do
  root   'top#home'
  post   '/users',          to: 'users#create'
  get    '/users',          to: 'users#show'
  get    '/users/:id/edit', to: 'users#edit',       as: 'edit_user'
  patch  '/users/:id',      to: 'users#update'
  get    '/login',          to: "sessions#new"
  post   '/login',          to: "sessions#create"
  delete '/logout',         to: "sessions#destroy", as: 'logout'
  get    '/skills/index',   to: "skills#index",     as: 'index_skill'
  patch  '/skills/:id',     to: "skills#update"
  # post   '/skills/new',      to: "skill#new"
  # post   '/skills/new',      to: "skills#create"
  # delete '/skills/:id',      to: "skill#delete"  
  resources :users
end
