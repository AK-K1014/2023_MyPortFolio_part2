Rails.application.routes.draw do
  root "top#home"
  get  "top/home"
  get  '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
end
