Rails.application.routes.draw do
  get '/search' => 'application#search', :as => 'search_page'
  get '/most_recent', to: 'posts#most_recent', as: 'recent'
  get '/users/:id/followers' => 'follows#followers'
  get '/users/:id/following' => 'follows#followees'
  post '/users/:id/follow_user' => 'follows#follow_user'
  post '/users/:id/unfollow_user' => 'follows#unfollow_user'
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
    

  resources :users, only: [:index, :show]
  resources :posts do
    resources :comments
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#welcome'
  
end
