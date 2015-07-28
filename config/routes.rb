Rails.application.routes.draw do

  # resources :card_sets do
  #   resources :cards, only: [:index, :show]
  # end

  jsonapi_resources :card_sets
  jsonapi_resources :cards

  use_doorkeeper
  devise_for :users, :controllers => {:sessions => "sessions", :registrations => "registrations"}

  get 'users/me', to: 'users#show'

  root to: 'visitors#index'
end
