Rails.application.routes.draw do
  devise_for :users

  root :to => 'homes#top'
  get 'home/top'
  get 'home/about'
  #resources :users, only:[:index, :show, :edit, :destroy]
  resources :posts,only:    [:index, :show, :create, :destroy] do
  resources :answers, only: [:create, :destroy] do
  resources :ratings, only: [:create]
  end
  end
  root 'homes#top'

  resources :users do
      member do
          get :following, :followers
      end
  collection do
  get :mypage
  end
  end
    resources :relationships, only: [:create, :destroy]
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
