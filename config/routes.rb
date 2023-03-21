Rails.application.routes.draw do


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
  resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  resources :orders, only: [:index, :show, :create, :new]
  resources :items, only: [:index, :show]
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
  resources :order_details, only: [:update]
  resources :items, except: [:destroy]
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
