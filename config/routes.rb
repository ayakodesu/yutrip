Rails.application.routes.draw do

  namespace :user do
    get 'homes/top'
    get 'homes/about'
    get 'favorites/index'
    get 'favorites/destroy'
    get 'favorites/create'
    get 'spots/new'
    get 'spots/index'
    get 'spots/edit'
    get 'spots/destroy'
    get 'spots/show'
    get 'spots/update'
    get 'spots/create'
  end

  namespace :admin do
    get 'spots/new'
    get 'spots/index'
    get 'spots/edit'
    get 'spots/destroy'
    get 'spots/show'
    get 'spots/update'
    get 'spots/create'
    get 'categories/new'
    get 'categories/index'
    get 'categories/edit'
    get 'categories/destroy'
    get 'homes/top'
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
