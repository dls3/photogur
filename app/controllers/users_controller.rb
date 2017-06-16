class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    # raise 'hell'
    @user = User.new(user_params)
    if @user.save
      redirect_to "/users"
    else
      render :new
    end
  end

private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end




 # u = User.create :email => 'doug@email.com', :password => 'abc123'
