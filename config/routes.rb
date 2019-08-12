Rails.application.routes.draw do
  devise_for :admins,controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

  devise_for :end_users, controllers: {
    sessions:      'end_users/sessions',
    passwords:     'end_users/passwords',
    registrations: 'end_users/registrations'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  #ルートでアイテムインデックス記載
  root "items#index"
  #アイテムのルーティング
  resources :items, only: [:show, :index] do
  #いいねコントローラ
  resource :likes, only: [:create, :destroy]
  end

  get "items/search" => "items#search", as:'search_items'

  resources :end_users, only: [:new, :edit, :create, :update, :show] do
    resource :orders, only: [:new, :create, :update, :show]
    end

  get 'end_users/:id/orders/confirm' => 'order#confirm', as:'confirm_order'


  #カートあいてむ
  resources :cart_items, only: [:create, :destroy, :update, :index]

  #商品管理
  resources :manage_items
  get "search/manage_items" => "manage_items#search", as:"search_manage_items"

  #エンドユーザー管理者
  resources :manage_end_users
  get 'manage_end_users/search' => "manage_end_users#search"

  #注文管理
  resources :manage_orders
  get "manage_orders/search" => "manage_orders#search", as:"search_manage_order"

  #カテゴリー
  resources :categories, only: [:create, :destroy, :update]

  #アーティスト
  resources :artists, only: [:create, :destroy, :update]

  #レーベル
  resources :labels, only: [:create, :destroy, :update]



end
