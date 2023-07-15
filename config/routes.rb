Rails.application.routes.draw do
  root   'top#home'
  get    '/login',             to: "sessions#new"
  post   '/login',             to: "sessions#create"
  delete '/logout',            to: "sessions#destroy", as: 'logout'
  get    '/skills/:id',        to: "skills#index",     as: 'index_skill'

  resources :users, only: [:show, :create, :edit, :update] do
    resource :skills, only: [:index, :new, :create, :update, :destroy]
  end

  resources :categories do
    resources :skills, only: [:index, :new, :create, :update, :destroy]
  end
end
