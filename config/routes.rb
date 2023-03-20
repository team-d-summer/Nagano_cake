Rails.application.routes.draw do


  namespace :public do
    get 'cart_items/index'
    get 'cart_items/update'
    get 'cart_items/destroy'
    get 'cart_items/destroy_all'
    get 'cart_items/create'
  end
# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

 scope module: :public do
  root to: "homes#top"
  get "/homes/public/about" => "homes#about", as: "about"
  get 'customer' => 'customers#show'
  resources :customers, only: [:show, :edit, :update, :unsubscribe, :withdraw] 
  resources :items, only: [:index, :show]
  delete "cart_items/destroy_all", to: "cart_items#destroy_all", as: "destroy_all"
  resources :cart_items, only: [:index, :update, :destroy, :create]
  resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  resources :orders, only: [:index, :show, :create, :new]
  
 end



# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
  root to: "homes#top"
  resources :orders, only: [:show, :update]
  resources :customers, only: [:index, :show, :edit, :update]
  get 'order_details/update'
  resources :items, except: [:destroy]
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
