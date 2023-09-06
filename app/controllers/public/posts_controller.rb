class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.end_user_id = current_user.id
  
    if @post.save
      redirect_to root_path
    else
      render :new # Re-render the new form if validation fails
    end
  end


  def index
  end

  def show
  end


  private

  def post_params
    params.require(:post).permit(:name, :image, :caption)
  end


end
