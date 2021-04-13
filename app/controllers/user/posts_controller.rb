class User::PostsController < ApplicationController

  before_action :authenticate_user!,except:[:top, :about]

#投稿一覧
  def index
    @posts = Post.all
    @post = Post.new
    @user = current_user
  end

  #投稿詳細
  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  #投稿編集
  def edit
   @post = Post.find(params[:id])
   @user = Post.find(params[:id])
  end

  #投稿
  def create
   @post = Post.new(post_params)
   @post.user_id = current_user.id
   if @post.save
     false[:success] = '投稿しました'
     redirect_to post_path(@post)
   else
     @posts = Post.all
     @user = current_user
     render 'index'
   end
  end

  #投稿更新
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "更新が完了しました"
    else
      render "edit"
    end
  end

  #投稿削除
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

end
