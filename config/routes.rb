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
    resources :users do 
      resources :feedbacks
    end
    resources :room_messages
    resources :rooms
    resources :categories
  end
end
