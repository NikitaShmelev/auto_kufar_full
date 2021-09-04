Rails.application.routes.draw do
  scope '/(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
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
    resources :categories
  end
  group :production do
    gem 'rails_12factor', '0.0.2'
  end
end
