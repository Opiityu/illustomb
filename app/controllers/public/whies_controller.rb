class Public::WhiesController < ApplicationController
  before_action :post_params


  def create
    Why.create(end_user_id: current_end_user.id, post_id: params[:id])
  end

  def destroy
    Why.find_by(end_user_id: current_end_user.id, post_id: params[:id]).destroy
  end

  private

  def post_params
    @post = Post.find(params[:id])
  end


end

###なんでボタンからRIPボタンに名称変更しています####