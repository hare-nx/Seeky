class Public::HomesController < ApplicationController
  before_action :set_q, only: [:top, :post_search]

  def top
    @posts=Post.where(status: true).order(created_at: :desc)
  end

  def about
  end

  def post_search
    @results = @q.result(distinct: true)
  end



  private

  def set_q
    @q = Post.where(status: true).ransack(params[:q])
  end

end
