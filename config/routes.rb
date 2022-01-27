# frozen_string_literal: true

Rails.application.routes.draw do
  get '/noises', to: 'noises#index'
  post '/noises', to: 'noises#create'

  root 'noises#index'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#delete'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end