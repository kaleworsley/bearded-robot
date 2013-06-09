class ApplicationController < ActionController::Base
  include AuthorizationSystem
  after_filter :validate_authorization_checked

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from 'AuthorizationSystem::NotAuthorized' do |exception|
    if current_user
      redirect_to :root, :alert => 'Not Authorized'
    else
      redirect_to login_path, :alert => 'Not Authorized'
    end
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
