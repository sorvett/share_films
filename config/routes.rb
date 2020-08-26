Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :new, :show, :edit, :update]
  resources :blogs do
  resources :blog_comments, only: [:create, :destroy]
  resource :favorites, only: [:create, :destroy]
  end
  root 'homes#top'
  get 'about' => 'homes#about'
end
