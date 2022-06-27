Rails.application.routes.draw do

  devise_for :users

  scope module: :public do
    root to: 'homes#top'
    get "about" => 'homes#about'
    get "search" => 'homes#search'
    resources :users, only: [:show, :edit, :update] do
      member do
        get "favorites"
        get "following"
        get "followers"
        get "comments"
        get "welcome"
        get "analysis"
        post "result"
        get "unsubscribe"
        patch "withdraw"
      end
    end
    resources :posts do
      member do
        post "confirm"
      end
      resources :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
  end

  devise_for :admins

  namespace :admin do
    root to: "homes#top"
    resources :users, only: [:show, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
