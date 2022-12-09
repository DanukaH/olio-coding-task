Rails.application.routes.draw do

  get 'home/index'
  root to: 'home#index'

  resources :articles, only: %i[index show]
end
