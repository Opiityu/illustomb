class Public::EndUsersController < ApplicationController
  before_action :find_end_user, only: [:show, :edit, :update]

  def show
    @posts = @end_user.posts.page(params[:page])
  end

  def edit
  end

  def update
    if @end_user.update(end_user_params)
      redirect_to public_end_user_path(@end_user)
    else
      # Handle validation errors or other errors here
      render :edit
    end
  end

  private

  def end_user_params
    params.require(:end_user).permit(:name)
  end

  def find_end_user
    @end_user = EndUser.find(current_end_user.id)
  end
end
