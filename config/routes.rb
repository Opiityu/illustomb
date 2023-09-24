Rails.application.routes.draw do
  namespace :admin do
    resources :end_users, only: [:index, :show, :destroy]
    resources :posts, only: [:index, :destroy]
  end

  namespace :public do
    resources :end_users, only: [:show, :edit, :update]
    resources :posts, only: [:new, :create, :index, :show, :destroy]

    # 退会確認画面
    get '/check' => 'end_users#check'
    # ユーザー削除用
    patch '/withdraw' => 'end_users#withdraw'

    post "why/:id" => "whies#create", as: "create_why"
    delete "why/:id" => "whies#destroy", as: "destroy_why"

    get 'guest_login', to: 'guest_sessions#guest_login'

  end

  # Managing routes for admin users
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  # Managing routes for end users
  devise_for :end_users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  get 'homes/about'
  root to: "homes#top"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :admin do
    resources :posts, only: [:index, :destroy]
    resources :end_users, only: [:index, :show]
  end

  # Search functionality
  get "search" => "searches#search"
end
