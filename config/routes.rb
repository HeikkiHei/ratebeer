# frozen_string_literal: true

Rails.application.routes.draw do
  resources :memberships
  resources :beer_clubs
  resources :users
  resources :beers
  resources :breweries
  resources :ratings, only: %i[index new create destroy]
  resources :places, only: %i[index show]
  resource :session, only: %i[new create destroy]
  
  root 'breweries#index'  
  
  post 'places', to:'places#search'
  get 'signin', to: 'sessions#new'
  get 'signup', to: 'users#new'

  delete 'signout', to: 'sessions#destroy'
end
