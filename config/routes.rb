Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
 resources :customers, only: [:show, :edit,:uodate,:unsubscribe,:withdrawl] 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
