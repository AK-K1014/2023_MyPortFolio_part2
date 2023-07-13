Rails.application.routes.draw do
  root   'top#home'
  post   '/users',             to: 'users#create'
  get    '/users',             to: 'users#show'
  get    '/users/:id/edit',    to: 'users#edit',       as: 'edit_user'
  patch  '/users/:id',         to: 'users#update'
  get    '/login',             to: "sessions#new"
  post   '/login',             to: "sessions#create"
  delete '/logout',            to: "sessions#destroy", as: 'logout'
  get    '/skills/:id',        to: "skills#index",     as: 'index_skill'
  patch  '/skills/:id',        to: "skills#update",    as: 'skill_update'
  delete '/skills/:id',        to: "skills#delete"
  get    '/skills/new',        to: "skills#new",       as: 'skill_new'
  post   '/skills/new',        to: "skills#create"

  resources :skills

  resources :users, only: [:show, :create, :edit, :update] do
    resource :skills, only: [:index, :new, :create, :update, :delete]
  end

  resources :categories do
    resources :skills, only: [:index, :new, :create, :update, :delete]
  end
end
