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
  resources :customers, only: [:show, :edit, :update, :unsubscribe, :withdraw] 
  resources :addresses, only: [:index, :edit, :create, :update, :destroy]
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
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
