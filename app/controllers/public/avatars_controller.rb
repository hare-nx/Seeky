class Public::AvatarsController < ApplicationController
  def create
    if current_user.status=="active"
      user=User.find(params[:user_user_id])
      avatar=current_user.avatar.new(avatar_params)
      avatar.user_id=user.user_id
      avatar.save
      redirect_to edit_user_path(user.user_id)
    else
      redirect_to user_path(current_user.user_id)
    end
  end
  def update
    if current_user.status=="active"
      avatar=Avatar.find_by(user_id: current_user.user_id)
      avatar.update(avatar_params)
      redirect_to edit_user_path(current_user.user_id)
    else
      redirect_to user_path(current_user.user_id)
    end
  end


  private
  def avatar_params
    params.require(:avatar).permit(:user_id, :profile_image)
  end
end
