Rails.application.routes.draw do
  get '/search' => 'application#search', :as => 'search_page'
  
  devise_for :users
  resources :posts do
    resources :comments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#welcome'
  
end
