class Public::EndUsersController < ApplicationController
  before_action :find_end_user, only: [:show, :edit, :update]

  def show
    @posts = @end_user.posts.page(params[:page])
    @post = current_end_user
  end

  def edit
    @end_user = current_end_user
  end

  def update
    if @end_user.update(end_user_params)
      redirect_to public_end_user_path(@end_user)
    else
      render :edit
    end
  end


  def check
   @end_user = current_end_user
  end

  def withdraw
    @end_user = EndUser.find(current_end_user.id)
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @end_user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end



  private

  def end_user_params
    params.require(:end_user).permit(:name, :profile_image)
  end

  def find_end_user
    @end_user = EndUser.find(current_end_user.id)
  end
end
