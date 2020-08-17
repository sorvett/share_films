Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :new, :show, :edit, :update]
  resources :blogs do
  end
  root 'homes#top'
  get 'about' => 'homes#about'
end
