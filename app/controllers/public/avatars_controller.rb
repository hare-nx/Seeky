class Public::AvatarsController < ApplicationController
  def create
    user=User.find(params[:user_user_id])
    avatar=current_user.avatar.new(avatar_params)
    avatar.user_id=user.user_id
    avatar.save
    redirect_to edit_user_path(user)
  end
  def update
    user=User.find(params[:user_user_id])
    avatar=Avatar.find_by(user_id: user.user_id)
    avatar.update(avatar_params)
    redirect_to edit_user_path(user)
  end


  private
  def avatar_params
    params.require(:avatar).permit(:user_id, :profile_image)
  end
end
