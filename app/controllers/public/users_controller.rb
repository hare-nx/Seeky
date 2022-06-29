class Public::UsersController < ApplicationController
  def edit
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
end
