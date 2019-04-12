Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :comments
    resources :suggestions
  end
  resources :likes, only: [:create, :destroy]
  resources :reports, only: [:create, :destroy]
  root 'posts/index'
end
