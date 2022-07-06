Rails.application.routes.draw do

  namespace :admin do
    get 'face_questions/edit'
    get 'face_questions/index'
  end
  namespace :admin do
    get 'frame_questions/edit'
    get 'frame_questions/index'
  end
  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do
    root to: 'homes#top'
    get "about" => 'homes#about'
    get "search" => 'homes#post_search'
    resources :users, param: :user_id, only: [:show, :edit, :update] do
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
    resources :frame_questions, only: [:create, :edit, :update, :index, :destroy]
    resources :face_questions, only: [:create, :edit, :update, :index, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
