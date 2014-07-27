Rails.application.routes.draw do

  resources :card_sets, only: [:index, :show] do
    resources :cards, only: [:index, :show]
  end

  use_doorkeeper
  root to: 'visitors#index'
  devise_for :users
end
