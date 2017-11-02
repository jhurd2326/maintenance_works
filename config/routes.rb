# frozen_string_literal: true

Rails.application.routes.draw do
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/register", to: "users#new"

  root "sessions#new"
  resources :users

  get "/home", to: "static_pages#home"
end
