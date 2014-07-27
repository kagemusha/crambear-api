Rails.application.routes.draw do
  use_doorkeeper
  root to: 'visitors#index'
  devise_for :users
end
