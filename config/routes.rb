# frozen_string_literal: true

Rails.application.routes.draw do
  resources :widgets
  root to: 'home#index'

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  resources :posts
  devise_for :users
  devise_for :models
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'report', to: 'report#index'
  get 'report/generate', to: 'report#generate'
end
