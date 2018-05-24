class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(id: session[:user_id], auth_token: session[:auth_token])
  end
  helper_method :current_user

  protected
  def authenticate
    redirect_to '/login' unless current_user
  end
end
