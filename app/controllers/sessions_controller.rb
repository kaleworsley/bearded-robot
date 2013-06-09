class SessionsController < ApplicationController
  def new
    authorize! { current_user.nil? }
  end
  
  def create
    authorize! { current_user.nil? }
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in!"
    else
      flash.now.alert = "Email or password is invalid"
      render "new"
    end
  end
  
  def destroy
    authorize! { current_user.present? }
    session[:user_id] = nil
    redirect_to login_path, notice: "Logged out!"
  end
end
