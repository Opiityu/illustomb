# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end
  
  
  # POST /resource/sign_in
  def create
    super do |resource|
      if end_user_signed_in?
        flash[:notice] = 'ログインしました'
      else
        flash[:alert] = 'ログインに失敗しました'
      end
    end
  end

  # DELETE /resource/sign_out
  def destroy
    super do
      flash[:notice] = 'ログアウトしました'
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
