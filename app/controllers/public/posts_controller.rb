class Public::PostsController < ApplicationController
  def index
    following_users=current_user.relationships.where(user_id: current_user.user_id).pluck(:follow_id)
    if following_users.present?
      @posts=Post.where(user_id: following_users).order(created_at: :desc)
    else
      @recommendation="ユーザーをフォローすると、投稿が見つけやすくなります。"
      @posts=Post.all
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
    @posts=Post.where(user_id: users).order(created_at: :desc)
  end

  def show
    @post=Post.find(params[:id])
    @comments=@post.comments.all
  end

  def new
    @post = Post.new

  end

  def create
    @post = Post.new(post_params)
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
    @post = Post.new(post_params)
  end





  private

  def post_params
    params.require(:post).permit(:outer, :tops, :bottoms, :shoes, :bag, :body, :post_image)
  end
end
