# frozen_string_literal: true
Rails.application.routes.draw do
  get 'categories/index'

  get 'categories/show'

  get 'categories/new'

  get 'categories/edit'

  resources :users, only: [:new, :create, :show]
  resources :blogs, except: [:index, :create], param: :name do
    resources :articles, param: :name
  end
  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
