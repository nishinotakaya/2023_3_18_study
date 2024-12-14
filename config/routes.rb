# == Route Map
#

Rails.application.routes.draw do
resources :users, only: %i[new create index show]
# get 'users/me'
get 'mypage', to: 'users#my_page'
post 'login', to: 'sessions#create'
delete 'login', to: 'sessions#destory'
  #⇑
  # get 'sessions/create'
  # get 'sessions/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  #boadsコントローラークラスのindex
  # get 'boards', to: 'boards#index'
  # get 'boards/new', to: 'boards#new'
  # post 'boards', to: 'boards#create'
  # get 'boards/:id', to: 'boards#show'
  #⇓
  resources :boards
  resources :comments, only: %i[create destroy]
end
