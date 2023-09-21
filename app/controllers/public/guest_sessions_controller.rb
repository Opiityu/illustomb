class Public::GuestSessionsController < ApplicationController
  def guest_login
    guest_user = EndUser.create_guest_user
    sign_in(guest_user) # Sign in the guest user
    redirect_to root_path # Redirect to the desired page after guest login
  end
end
