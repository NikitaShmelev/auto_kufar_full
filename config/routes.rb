Rails.application.routes.draw do
  
  resources :room_messages
  resources :rooms
  root to: 'posts#index'
  devise_for :users, :path_prefix => 'd', controllers: {
    sessions: 'users/sessions',
  }
  
  resources :posts
  get 'users/:id' => 'users#show'
  resources :users, :only => [:show]
  resources :room_messages
  resources :rooms

end
