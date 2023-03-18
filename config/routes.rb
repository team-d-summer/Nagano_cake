Rails.application.routes.draw do
  namespace :admin do
    get 'orders/show'
    get 'orders/update'
  end
  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
