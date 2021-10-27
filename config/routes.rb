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
  get 'homes/random' => 'homes#random'

  #ユーザー側のルーティング
  get 'quotes/user_posts' => 'quotes#user_posts' #ユーザーの投稿と管理者側の投稿を分けるためにページも別々に
  get 'end_users/:id/withdrawal' => 'end_users#withdrawal', as: 'withdrawal' #退会確認ページ
  patch 'end_users/:id/unsubscribe' => 'end_users#unsubscribe', as: 'unsubscribe' #退会フラグを更新する
  get 'end_users/:id/following' => 'end_users#following', as: 'follow_list'
  get 'end_users/:id/followers' => 'end_users#followers', as: 'follower_list'

  resources :quotes do
    resource :evaluations, only: [:create]
    resources :comments, only: [:create, :destroy]
  end
  resources :end_users, only: [:show, :edit, :update] do
    resources :relationships, only: [:create, :destroy]
  end
  resources :person_profiles, only: [:index, :show]
  resources :contacts, only: [:new, :create]

  #管理者側のルーティング
  namespace :admins do
    get 'quotes/user_posts' => 'quotes#user_posts'
    resources :quotes do
      resources :comments, only: [:destroy]
    end
    resources :end_users, only: [:index, :show, :edit, :update]
    resources :categories, only: [:index, :create, :update, :destroy]
    resources :person_profiles
  end
end
