class Public::SessionsController < Devise::SessionsController
  
  
 
  def create
    super do |resource|
      if end_user_signed_in?
        flash[:notice] = 'ログインしました'
      else
        flash[:alert] = 'ログインに失敗しました'
      end
    end
  end

  
  def destroy
    super do
      flash[:notice] = 'ログアウトしました'
    end
  end

end
