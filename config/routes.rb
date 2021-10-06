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
  resources :quotes
  get 'quotes/user_posts' => 'quotes#user_posts' #ユーザーの投稿と管理者側の投稿を分けるためにページも別々に
  resources :end_users, only: [:show, :edit, :update]
  get 'end_users/withdrawal' => 'end_users#withdrawal'
  patch 'end_users/unsubscribe' => 'end_users#unsubscribe'
  resources :person_profiles, only: [:index, :show]

  #管理者側のルーティング
  namespace :admins do
    resources :quotes
    get 'quotes/user_posts' => 'quotes#user_posts'
    resources :end_users, only: [:index, :show, :edit, :update]
    resources :attributes, only: [:index, :create, :edit, :update, :destroy]
    resources :person_profiles
  end
end
