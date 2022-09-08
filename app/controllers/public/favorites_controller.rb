class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    if current_user.status=="active"
      post=Post.find(params[:post_id])
      favorite=current_user.favorites.new(post_id: post.id)
      favorite.save
    end
    redirect_to post_path(post)
  end
  def destroy
    if current_user.status=="active"
      post=Post.find(params[:post_id])
      favorite=current_user.favorites.find_by(post_id: post.id)
      favorite.destroy
    end
    redirect_to post_path(post)
  end
end
