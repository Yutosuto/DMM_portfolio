class UsersController < ApplicationController

  before_action :authenticate_user!

  #会員マイページ
  def show
    @user = User.find(params[:id])
    @posts = current_user.posts
    @post_images = @user.posts.page(params[:page]).reverse_order
  end

  #会員情報編集
  def edit
    @user = User.find(params[:id])
  end

  #会員情報更新
  def update
    current_user.update(user_params)
    redirect_to user_path(current_user)
  end

private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
