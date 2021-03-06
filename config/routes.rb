Rails.application.routes.draw do
  namespace :admin do
    resources :categories
      resources :products
    resources :orders do
      member do
        post :cancel
        post :ship
        post :shipped
        post :return
      end
    end
  end

  devise_for :users
  root 'welcome#index'

  resources :products do
     member do
       post :add_to_cart
     end
     collection do
      get :search
     end
   end

   resources :carts do
     collection do
       delete :clean
       post :checkout
     end
   end

   resources :cart_items
   resources :orders

   namespace :account do
   resources :orders do
      member do
        post :pay_with_alipay
        post :pay_with_wechat
        post :apply_to_cancel
      end
    end
  end
end
