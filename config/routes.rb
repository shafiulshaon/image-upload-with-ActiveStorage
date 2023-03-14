Rails.application.routes.draw do

  root to: 'sessions#new'

  resources :images, only: [:index, :new, :create]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'

end
