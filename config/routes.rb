Rails.application.routes.draw do
  root 'homes#top'
  get 'home/about' => 'homes#about'
  
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
   }
  resources :users,only: [:show,:index,:edit,:update] do
    member do
      get :following, :followers
    end
    resource :relationships, only: [:create, :destroy]
  end
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  
  get '/search' => 'search#search'
  
  resources :rooms, only: [:show, :create] do
    resource :messages, only: [:create]
  end
end