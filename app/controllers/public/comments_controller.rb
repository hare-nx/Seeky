class Public::CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    post=Post.find(params[:post_id])
    comment=current_user.comments.new(comment_params)
    comment.post_id=post.id
    if current_user.status=="active"
      comment.save
    end
    redirect_to post_path(post)
  end

  def destroy
    if current_user.status=="active"
      Comment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    end
    redirect_to comments_user_path(params[:post_id])
  end


  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
