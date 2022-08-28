Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  scope module: :public do
    root to: 'homes#top'
    get "about" => 'homes#about'
    get "search" => 'homes#post_search'
    resources :users, param: :user_id, only: [:show, :edit, :update, :index] do
      collection do
        get "search" => 'users#user_search'
      end
      member do
        get "favorites"
        get "following"
        get "followers"
        get "comments"
        get "welcome"
        get "frame_type_analysis"
        post "frame_type_result"
        get "face_type_analysis"
        post "face_type_result"
        get "unsubscribe"
        patch "withdraw"
      end
    end
    resources :posts, only: [:show, :new, :create, :edit, :update, :destroy, :index] do
      collection do
        get "suggested"
        # post "confirm"
      end
      resource :reports, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy] do
        resource :reports, only: [:create, :destroy]
      end
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
    resources :comments, only: [:index, :update, :show]
    resources :posts, only: [:index, :update, :show]
    resources :frame_questions, only: [:create, :edit, :update, :index, :destroy]
    resources :face_questions, only: [:create, :edit, :update, :index, :destroy]
    get "reported_posts" => 'reports#reported_posts'
    get "reported_comments" => 'reports#reported_comments'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
