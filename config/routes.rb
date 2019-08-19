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

  resources :end_users, only: [:new, :edit, :create, :update, :show, :destroy] do
    resources :orders, only: [:new, :create, :update, :index]

    resources :addresses
    collection do
    get 'change_password'
    end
   end

resources :admins, only: [:index]

  get 'end_users/:id/orders/confirm' => 'orders#confirm', as:'confirm_order'
  get "end_users/:id/orders/complete" => "orders#complete", as:"complete_order"
  # get 'end_users/password/change' => 'end_users#change_password', as:'change_password'

  #カートあいてむ
  resources :cart_items, only: [:create, :destroy, :update, :index]

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
  resources :categories, only: [:create, :destroy, :update]

  #アーティスト
  resources :artists, only: [:create, :destroy, :update]

  #レーベル
  resources :labels, only: [:create, :destroy, :update]

  # レビュー
  resources :reviews

end
