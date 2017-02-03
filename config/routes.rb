Rails.application.routes.draw do
  root 'rereddit#index'
  get '/auth/reddit', as: :reddit_login
  get '/auth/reddit/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get 'dashboard', to: 'dashboard#index'
  get '/r/:subreddit_name/comments', to: "posts#show"
end
