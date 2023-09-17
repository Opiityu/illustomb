Rails.application.routes.draw do
  namespace :admin do
    get 'end_users/index'
    get 'end_users/show'
  end
  namespace :public do
    resources :end_users, only: [:show, :edit, :update]
    resources :posts, only: [:new, :create, :index, :show, :destroy]


    #退会確認画面
    get '/check' => 'end_users#check'
    #論理削除用
    patch '/withdraw' => 'end_users#withdraw'

    post "why/:id" => "whies#create", as: "create_why"
    delete "why/:id" => "whies#destroy", as: "destroy_why"

  end
  # 管理者用.
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  ###会員
  devise_for :end_users,skip: [:passwords], controllers: {
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




end
