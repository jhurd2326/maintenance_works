# frozen_string_literal: true

Rails.application.routes.draw do
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/register", to: "users#new"
  get "/logout", to: "sessions#destroy"
  get "/dashboard", to: "static_pages#dashboard"
  get "/upload_requests", to: "uploads#new"
  post "/upload_requests", to: "uploads#create"

  root "sessions#new"

  resources :users, :hospitals, :notes
  resources :requests do
    get :abandoned, on: :member
    get :repaired, on: :member
  end
end
