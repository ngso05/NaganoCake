Rails.application.routes.draw do
  #admin
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }

  namespace :admins do
   resources :items, only: [:new, :create, :index, :show, :edit, :update]
   resources :genres, only: [:create, :index, :edit, :update]
  
   root :to => 'homes#top'
  end

  #customer
  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    passwords: 'customers/passwords',
    registrations: 'customers/registrations'
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
