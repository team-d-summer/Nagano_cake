Rails.application.routes.draw do

# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

 scope module: :public do
  root to: "homes#top"
  resources :customers, only: [:show, :edit,:uodate,:unsubscribe,:withdrawl]
  resources :addresses, only: [:index, :edit, :create, :update, :destroy]

 end

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
  root to: "homes#top"
  resources :items, except: [:destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
