Rails.application.routes.draw do
  get 'home/about', to: 'homes#about'
  devise_for :users

  root to: 'homes#top'
  resources :books, only: [:new, :index, :show, :create, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only:[:create, :destroy]
  end
  
  resources :users, only: [:index, :show, :edit, :update]
end
