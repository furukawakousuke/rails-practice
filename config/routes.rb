Rails.application.routes.draw do
  
  
  devise_for :admin,controllers:{
sessions: "admin/sessions"
  }
  devise_for :customer,controllers:{
   registrations: "public/registrations",
   sessions: 'public/sessions'
  }
  
  namespace :admin do
    root to: 'homes#top'
    resources :orders,only:[:index,:show,:update]
    resources :order_details,only:[:update]
    resources :customers,only:[:index,:show,:edit,:update]
    resources :genres,only:[:index,:edit,:create,:update]
    resources :items,only:[:index,:new,:show,:edit,:create,:update]
  end
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources :addresses,only:[:index,:edit,:create,:update,:destroy]
    get 'orders/complete'
    post 'orders/confirm'
    resources :orders,only:[:new,:index,:show,:create]
    resources :cart_items do
     collection do
          delete 'destroy_all'
        end
    end
    resources :cart_items,only:[:index,:create,:update,:destroy]
    get 'customers/unsubscribe'
    patch '/customers/withdraw'
    get 'customers/mypage' => 'customers#show'
    resources :customers,only:[:edit,:update]
    resources :items,only:[:index,:show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
