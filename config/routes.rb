# frozen_string_literal: true

Rails.application.routes.draw do
  get '/noises', to: 'noises#index'
  post '/noises', to: 'noises#create'

  root 'noises#index'

  get '/users/new', to: 'users#index'
  post '/users/new', to: 'users#create'

  get '/sessions/new', to: 'sessions#new'
  post '/sessions/new', to: 'sessions#create'
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end