class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.end_user_id = current_end_user.id

    if @post.save
      redirect_to public_posts_path
    else
      render :new
    end
  end


  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    post = Post.find_by(id: params[:id])

    if post
      post.destroy
      redirect_to public_posts_path
    else
      flash[:error] = "Post not found"
      redirect_to public_posts_path
    end
  end


  private

  def post_params
    params.require(:post).permit(:name, :image, :caption)
  end


end
