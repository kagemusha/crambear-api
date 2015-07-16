Rails.application.routes.draw do

  # resources :card_sets do
  #   resources :cards, only: [:index, :show]
  # end

  jsonapi_resources :card_sets do
    jsonapi_resources :cards
  end


  use_doorkeeper
  devise_for :users, :controllers => {:sessions => "sessions"}

  get 'users/me', to: 'users#show'

  root to: 'visitors#index'
end
