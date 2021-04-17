Rails.application.routes.draw do
  
  root to: 'homes#top'
  
  get 'home/about', to: 'homes#about'
  
  devise_for :users
  
  resources :users
  # resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy] 

  resources :books

end