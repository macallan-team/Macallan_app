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
  resources :likes, only: [:index]
  
  resources :end_users, only: [:new, :edit, :create, :update, :show, :destroy] do
    resources :orders, only: [:new, :create, :update, :index]
    resources :addresses, only: [:new, :edit, :create, :update, :destroy]

  collection do
  get 'change_password'
  end

  end
  get 'end_users/:end_user_id/orders/confirm/' => "orders#confirm", as:"confirm_end_user_order"
  get "/order/complete" => "orders#complete", as:"complete_order"


resources :admins, only: [:index]

  # get 'end_users/password/change' => 'end_users#change_password', as:'change_password'

  #カートあいてむ
  resources :cart_items, only: [:create, :destroy, :index]
  post "cart_item/count"  => "cart_items#update",as:"cart_item_count"

  #商品管理
  resources :manage_items do
    member do
      get :move_lower
      get :move_higher
      get :restore
    end
  end

  #エンドユーザー管理者
  resources :manage_end_users
  get 'manage_end_users/search' => "manage_end_users#search"

  #注文管理
  resources :manage_orders

  #カテゴリー
  resources :categories, only: [:create, :update]
  delete 'category/destroy' => "categories#destroy", as: 'destroy_category'

  #アーティスト
  resources :artists, only: [:create, :update]
  delete 'artist/destroy' => "artists#destroy", as: 'destroy_artist'

  #レーベル
  resources :labels, only: [:create, :update]
  delete 'label/destroy' => "labels#destroy", as: 'destroy_label'


  # レビュー
  resources :reviews

  resources :taxes, only: [:create, :update, :destroy, :index]
  get 'tax/select' => "taxes#select", as: 'select_tax'
  #　税率
  resources :carriages, only: [:create, :update, :destroy, :index]
  get 'carriage/select' => "carriages#select", as: 'select_carriage'

end
