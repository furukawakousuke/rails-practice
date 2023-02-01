Rails.application.routes.draw do
  
  
  devise_for :admin,controllers:{
sessions: "admin/sessions"
  }
  devise_for :customer,controllers:{
   registrations: "public/registrations",
   sessions: 'public/sessions'
  }
  
  namespace :admin do
    resources :orders,only:[:show]
    resources :customers,only:[:index,:show,:edit]
    resources :genres,only:[:index,:edit,:create,:update]
    resources :items,only:[:index,:new,:show,:edit,:create,:update]
  end
  scope module: :public do
    root to: 'homes#top'
    get 'homes/about'
    resources :addresses,only:[:index,:edit]
    get 'orders/complete'
    resources :orders,only:[:new,:index,:show]
    resources :cart_items,only:[:index]
    resources :customers,only:[:show,:edit]
    resources :items,only:[:index,:show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
