class Public::UsersController < ApplicationController
  def show
    @user=User.find(params[:user_id])
    @following_user=current_user.relationships.find_by(follow_id: @user.user_id)
    @relationship=Relationship.new
    @followers=Relationship.where(follow_id: @user.user_id)
    @posts=@user.posts.all
  end

  def edit
    @user=User.find_by(user_id: current_user.user_id)
  end

  def update
    user=User.find_by(user_id: current_user.user_id)
    user.update(user_params)
    redirect_to user_path(user)
  end

  def favorites
  end

  def following
  end

  def followers
  end

  def comments
  end

  def welcome
    @user.user_id=current_user.user_id
  end

  def analysis
  end

  def result
  end

  def unsubscribe
  end





  private

  def user_params
    params.require(:user).permit(:user_id, :user_name, :email, :password, :face_type, :frame_type, :stature, :introduction)
  end
end
