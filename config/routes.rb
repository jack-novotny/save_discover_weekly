Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/auth/spotify/callback', to: 'users#spotify'
  get '/users/spotify', to: 'homes#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get 'homes/index/:spotify_user', to: 'homes#index'
  root 'homes#index'
  get '*path', to: redirect('/')
end
