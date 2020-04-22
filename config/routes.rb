Rails.application.routes.draw do
	get 'home/about' => "home#about"
	root to: 'home#top'
	devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  resources :books, only: [:new, :create, :index, :show] do
    resource :favorites, only: [:create, :destroy]
    resource :book_comments, only: [:create, :destroy]
end
end