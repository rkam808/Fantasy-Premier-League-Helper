Rails.application.routes.draw do
  root to: 'clubs#index'

  resources :teams do
    resources :fantasy, only: [:new, :create]
  end
  resources :fantasy, only: [:destroy]

  resources :clubs, only: [:index, :show]
end
