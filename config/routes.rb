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
   resources :orders, only: [:show, :update]
   resources :order_details, only: [:update]

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
    delete 'cart_items/destroy_all' => 'cart_items#all_destroy'
    resources :customers, only: [:show, :edit, :update] do
      collection do
        get 'withdraw'
        patch 'withdraw'
        get 'unsubscribe'
      end
    end
    post 'orders/confirm' => 'orders/confirm'
    resources :orders, only: [:show, :new, :index, :create] do
      collection do
        get 'thanks'
        get 'confirm'
      end
    end

    resources :addresses, only: [:index, :create, :edit, :update, :destroy]

    root :to => 'homes#top'
    get 'homes/about' => 'homes#about'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
