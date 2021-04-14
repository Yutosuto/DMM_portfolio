Rails.application.routes.draw do

#devise
  devise_for :admins, controllers: {
   sessions:  'admins/sessions'
  }
  devise_for :users

#homes
  root 'homes#top'
  get "homes/about" => "user/homes#about"

#users
 resources :posts, only: [:index, :show, :edit, :create, :update, :destroy] do
 resources :post_images, only: [:new, :create, :index, :show, :destroy]
 resources :users, only: [:show, :edit, :update]
 resources :favorites, only: [:create, :destroy]
 end
end
