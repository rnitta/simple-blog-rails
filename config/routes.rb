# frozen_string_literal: true
Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :blogs, except: [:index, :create], param: :name do
    resources :articles, param: :name
    resources :categories
  end
  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
