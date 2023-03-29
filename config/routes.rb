Rails.application.routes.draw do

  namespace :user do
    get '/' => 'homes#top'
    get 'homes/about'
    resource :favorites, only: [:destroy, :create]
    resources :spots, only: [:new, :index, :edit, :destroy, :show, :update, :create]
    resources :reviews, only: [:new, :index, :edit, :destroy, :show, :update, :create]
    resources :favorites, only: [:index]

  end

  namespace :admin do
    get 'homes/top'
    resources :spots, only: [:new, :index, :edit, :destroy, :show, :update, :create]
    resources :categories, only: [:new, :index, :edit, :destroy, :create]
  end

  #devise_for :admins
  #devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

# 顧客用
# URL /users/sign_in ...
devise_for :users,skip: [:passwords], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}



end
