Rails.application.routes.draw do

  devise_for :users
  root 'user/homes#top'
  get "homes/about" => "homes#about"

end
