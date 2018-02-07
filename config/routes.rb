# frozen_string_literal: true

Rails.application.routes.draw do
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/register", to: "users#new"
  get "/logout", to: "sessions#destroy"
  get "/dashboard", to: "static_pages#dashboard"

  root "sessions#new"

  resources :users
  resources :requests
  resources :notes
end
