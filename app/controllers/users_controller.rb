class User::UsersController < ApplicationController

  before_action :authenticate_user!

  #会員マイページ
  def show
    @user = User.find(params[:id])
    @posts = current_user.posts
  end

  #会員情報編集
  def edit
  end

  #会員情報更新
  def update
    current_user.update(user_params)
    redirect_to user_users_path
  end

end
