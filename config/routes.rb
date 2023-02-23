Rails.application.routes.draw do
  namespace :admin do
    get 'homes/top'
  end
  namespace :user do
    get 'homes/top'
    get 'homes/about'
  end
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

# 顧客用
# URL /users/sign_in ...
#devise_for :users,skip: [:passwords], controllers: {
  #registrations: "user/registrations",
  #sessions: 'user/sessions'
#}

# 管理者用
# URL /admin/sign_in ...
#devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  #sessions: "admin/sessions"
#}



end
