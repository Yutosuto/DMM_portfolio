class User::PostCommentsController < ApplicationController

 before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @post_comment = BookComment.new(post_comment_params)
    @post_comment.post_id = @book.id
    @post_comment.user_id = current_user.id
    unless @post_comment.save
      render 'error'
    end
  end

  def destroy
    @post = Post.find(params[:id])
     post_comment = @post.post.post_comment.find(params[:id])
     post_comment.destroy
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end 
end
