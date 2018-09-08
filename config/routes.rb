# frozen_string_literal: true

Rails.application.routes.draw do
  resources :beers
  resources :breweries

  root 'breweries#index'
  get 'kaikki_bisset', to: 'beers#index'

  # get 'ratings', to: 'ratings#index'
  # get 'ratings/new', to: 'ratings#new'
  # post 'ratings', to: 'ratings#create'

  resources :ratings, only: %i[index new create destroy]
end
