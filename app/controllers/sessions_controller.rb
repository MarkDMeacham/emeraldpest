class SessionsController < ApplicationController
  skip_before_filter :authenticate

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:auth_token] = user.auth_token
      redirect_to '/dashboard'
      return
    end

    redirect_to '/login', flash: {alert: "Wrong username or password."}
  end

  def destroy
    session[:user_id] = nil
    session[:auth_token] = nil
    redirect_to '/login', flash: {notice: "Logged out successfully."}
  end
end
