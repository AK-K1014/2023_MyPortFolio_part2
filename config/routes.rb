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
  get    '/skills/index',    to: "categories#show"
  # patch  '/skills/:id',     to: "skills#update"
  # delete '/skills/:id',      to: "skill#delete"
  get    '/skills/new',     to: "skills#new",      as: 'skill_new'
  post   '/skills/new',     to: "skills#create"
  resources :users, only: [:show, :create, :edit, :update] do
    resource :skills, only: [:index, :new, :create]
  end
end
