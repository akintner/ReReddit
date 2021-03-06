Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'rereddit#index'
  get '/auth/reddit', as: :reddit_login
  get '/auth/reddit/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get 'dashboard', to: 'dashboard#index'
end
