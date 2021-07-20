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
   resources :customers, only: [:show, :index, :edit, :update]

   root :to => 'homes#top'
  end

  #customer
  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    passwords: 'customers/passwords',
    registrations: 'customers/registrations'
  }

  namespace :customers do
    resources :items, only: [:show, :index]
    resources :cart_items, only: [:create, :index, :update, :destroy]
    delete 'cart_items' => 'cart_items#all_destroy', as: 'all_destroy'
    resources :customers, only: [:show, :edit, :update]
    patch 'withdraw' => 'customers#withdraw'
    get 'unsubscribe' => 'customers#unsubscribe'
    resources :orders, only: [:show, :new, :index, :create]
    get 'thanks' => 'customers#thanks'
    post 'confirm' => 'customers#confirm'

    root :to => 'homes#top'
    get 'about' => 'homes#about'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
