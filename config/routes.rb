Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }

  devise_for :end_users, controllers: {
    sessions: 'end_users/sessions',
    passwords: 'end_users/passwords',
    registrations: 'end_users/registrations'
  }

  root to: 'homes#top'
  get 'homes/about' => 'homes#about'
  get 'homes/description' => 'homes#description'
  get 'homes/random' => 'homes#random'

  #ユーザー側のルーティング
  get 'quotes/user_posts' => 'quotes#user_posts' #ユーザーの投稿と管理者側の投稿を分けるためにページも別々に
  get 'end_users/withdrawal' => 'end_users#withdrawal' #退会確認ページ
  patch 'end_users/unsubscribe' => 'end_users#unsubscribe' #退会フラグを更新する
  
  resources :quotes do
    resource :evaluations, only: [:create]
    resources :comments, only: [:create, :destroy]
  end
  resources :end_users, only: [:show, :edit, :update] do
    get :following, :followers
    resources :relationships, only: [:create, :destroy]
  end
  resources :person_profiles, only: [:index, :show]

  #管理者側のルーティング
  namespace :admins do
    get 'quotes/user_posts' => 'quotes#user_posts'
    resources :quotes
    resources :end_users, only: [:index, :show, :edit, :update]
    resources :categories, only: [:index, :create, :update, :destroy]
    resources :person_profiles
  end
end
