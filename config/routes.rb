# frozen_string_literal: true
Rails.application.routes.draw do
  get 'blogs/show'

  get 'blogs/new'

  get 'blogs/edit'

  resources :users, only: [:new, :create, :show]
  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
