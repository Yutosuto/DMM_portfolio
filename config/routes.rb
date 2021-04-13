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
 resource :posts, only: [:index, :show, :edit, :create, :update, :destroy] do
 resource :users, only: [:show, :edit, :update]
 resource :favorites, only: [:create, :destroy]
 end
end
