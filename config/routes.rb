Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :comments
    resources :post_suggestions
  end
  resources :reviews, only: [:index, :update]
  resources :suggestions, only: [:index]
  resources :likes, only: [:create, :destroy]
  resources :reports, only: [:create, :destroy]
  resources :review_reports
  root 'posts#index'
  post '/upload_image' => 'upload#upload_image', as: :upload_image
  get '/download_file/:name' => 'upload#access_file', as: :upload_access_file, name: /.*/
end
