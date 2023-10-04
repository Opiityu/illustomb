class Admin::EndUsersController < ApplicationController
   before_action :authenticate_admin!

  
  def index
    @end_users = EndUser.page(params[:page]).per(10)
  end

  def show
    @end_user = EndUser.find(params[:id])
    @posts = @end_user.posts
  end

  def destroy
    @end_user = EndUser.find(params[:id])

    if @end_user.destroy
      flash[:notice] = "ユーザーを削除しました"
    else
      flash[:alert] = "ユーザーの削除に失敗しました"
    end

    redirect_to admin_end_users_path
  end
end
