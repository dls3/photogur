class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Successfully logged in"
      redirect_to pictures_url, notice: "Logged in!"
    else
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Successfully logged in"
    redirect_to pictures_url, notice: "Logged out!"
  end
end
