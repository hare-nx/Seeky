class Public::PostsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @post=Post.new
  end

  def create
    @post=Post.new(post_params)
    @post.user_id=current_user.user_id
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
  end

  def confirm
    @post=Post.new(post_params)
  end





  private

  def post_params
    params.require(:post).permit(:outer, :tops, :bottoms, :shoes, :bag, :body, :post_image)
  end
end
