Rails.application.routes.draw do
  devise_for :customers

  devise_for :admins
  namespace :admins do
    resources :items
  get 'top'=>'admins/admins/homes#top'
  end
end
