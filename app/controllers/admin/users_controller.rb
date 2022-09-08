class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    @user.update(user_params)
    if @user.status=="withdrawal"
      @user.posts.destroy_all
      @user.comments.destroy_all
    end
    redirect_to admin_user_path(@user)
  end




  private
  def user_params
    params.require(:user).permit(:status)
  end
end
