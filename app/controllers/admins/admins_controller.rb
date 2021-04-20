class Admins::AdminsController < ApplicationController

  before_action :authenticate_admin!

  #会員一覧
  def index
    @user = User.page(params[:page]).per(10)
  end

  #会員詳細
  def show
     @user = User.find(params[:id])
  end

  #会員退会
  def destroy
     @user = User.find(params[:id])
     @public.destroy
  end

  #会員情報更新
  def update
     @public = Public.find(params[:id])
     if @user.update(user_params)
       redirect_to admin_path
     else
       render "show"
     end
  end

  def user_params
    params.require(:user).permit(:name, :email, :address, :is_deleted)
  end
end