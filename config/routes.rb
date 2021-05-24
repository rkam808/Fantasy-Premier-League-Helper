Rails.application.routes.draw do
  root to: 'clubs#index'

  resources :teams do
    resources :fantasies, only: [:new, :create]
  end
  resources :fantasies, only: [:destroy]

  resources :clubs, only: [:index, :show]
end
