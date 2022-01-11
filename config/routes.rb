# frozen_string_literal: true

Rails.application.routes.draw do
  get '/noises', to: 'noises#index'
  post '/noises', to: 'noises#create'

  root 'noises#index'

  get '/users', to: 'users#index'
  post '/users', to: 'users#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end