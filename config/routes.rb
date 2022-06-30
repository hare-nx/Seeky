Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do
    root to: 'homes#top'
    get "about" => 'homes#about'
    get "search" => 'homes#search'
    resources :users, param: :user_id, only: [:show, :edit, :update] do
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
    resources :posts, only: [:show, :new, :create, :edit, :update, :destroy, :index] do
      collection do
        get "suggested"
        # post "confirm"
      end
      resources :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    resources :relationships, only: [:create, :destroy]
  end

  devise_for :admins, controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    root to: "homes#top"
    resources :users, only: [:show, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
