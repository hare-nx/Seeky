class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @comments=Comment.all
  end

  def show
    @comment=Comment.find(params[:id])
  end

  def update
    @comment=Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to admin_comment_path(@comment)
  end



  private

  def comment_params
    params.require(:comment).permit(:status)
  end
end
