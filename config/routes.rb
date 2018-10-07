# frozen_string_literal: true

Rails.application.routes.draw do
  resources :memberships
  resources :beer_clubs
  resources :users
  resources :beers
  resources :breweries
  resources :ratings, only: %i[index new create destroy]
  resource :session, only: %i[new create destroy]
  
  root 'breweries#index'

  get 'places', to: 'places#index'
  post 'places', to:'places#search'

  get 'signin', to: 'sessions#new'
  delete 'signout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'
end
