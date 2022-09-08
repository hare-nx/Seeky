class Public::RelationshipsController < ApplicationController

  before_action :set_user

  def create
    if current_user.status=="active"
      following = current_user.follow(@user)
      following.save
      if params[:following]
        redirect_to following_user_path
      else
        redirect_to user_path(@user)
      end
    else
      redirect_to user_path(@user)
    end
  end

  def destroy
    if current_user.status=="active"
      following = current_user.unfollow(@user)
      following.destroy
      redirect_to @user
    else
      redirect_to user_path(@user)
    end
  end

  private
  def relationship_params
    params.require(:relationship).permit(:user_id, :follow_id)
  end

  def set_user
    @user = User.find(params[:follow_id])
  end
end
