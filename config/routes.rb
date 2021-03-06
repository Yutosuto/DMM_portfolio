Rails.application.routes.draw do

#devise
  devise_for :admins, controllers: {
   sessions:  'admins/sessions'
  }
  devise_for :users

#homes
  root 'homes#top'
  get "homes/about" => "homes#about"

#users
 resources :posts, only: [:index, :show, :edit, :create, :update, :destroy, :new] do
     resources :post_comments, only:[:create, :destroy]
     resource :favorites, only: [:create, :destroy]
 end
  resources :users, only: [:show, :edit, :update]

end
