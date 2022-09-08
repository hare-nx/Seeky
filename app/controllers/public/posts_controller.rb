class Public::PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    following_users=current_user.relationships.where(user_id: current_user.user_id).pluck(:follow_id)
    if following_users.present?
      @posts=Post.where(user_id: following_users, status: true).order(created_at: :desc)
    else
      @recommendation="ユーザーをフォローすると、投稿が見つけやすくなります。"
      @posts=Post.where(status: true).order(created_at: :desc)
    end
  end

  def suggested
    if (current_user.face_type && current_user.frame_type).present?
      users=User.where(face_type: current_user.face_type).where(frame_type: current_user.frame_type)
    elsif (current_user.face_type==nil)&&(current_user.frame_type!=nil)
      users=User.where(frame_type: current_user.frame_type)
    elsif (current_user.face_type!=nil)&&(current_user.frame_type==nil)
      users=User.where(face_type: current_user.face_type)
    end
    @posts=Post.where(user_id: users, status: "active").order(created_at: :desc)
  end

  def show
    post=Post.find(params[:id])
    if post.status==true
      @post=post
      @comments=@post.comments.where(status: true).order(created_at: :desc)
      @comment=Comment.new
    else
      redirect_to posts_path
    end
  end

  def new
    if current_user.status=="active"
      @post = Post.new
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user_id=current_user.user_id
    if current_user.status=="active"
      if @post.save
        redirect_to post_path(@post)
      else
        render :new
      end
    else
      redirect_to new_post_path
    end
  end

  def edit
    if current_user.status=="active"
      @post=Post.find(params[:id])
    end
  end

  def update
    if current_user=="active"
      post=Post.find(params[:id])
      if post.update(post_params)
        redirect_to post_path(post)
      else
        render :edit
      end
    else
      redirect_to edit_post_path(post)
    end
  end

  def destroy
    post=Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end



  private

  def post_params
    params.require(:post).permit(:outer, :tops, :bottoms, :shoes, :bag, :body, :post_image)
  end
end
