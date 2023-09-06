Rails.application.routes.draw do
  namespace :public do
    resources :posts, only: [:new, :create, :index, :show]
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
end
