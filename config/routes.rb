Rails.application.routes.draw do

  root 'user/homes#top'
  get "homes/about" => "homes#about"

end
