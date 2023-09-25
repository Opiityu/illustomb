class Admin::PostsController < ApplicationController
  def index
    @posts = Post.page(params[:page])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path, notice: 'Post deleted successfully.'
  end

  private
  
end
