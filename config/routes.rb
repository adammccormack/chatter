# frozen_string_literal: true

Rails.application.routes.draw do
  get '/noises', to: 'noises#index'
  post '/noises', to: 'noises#create'

  root 'noises#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
