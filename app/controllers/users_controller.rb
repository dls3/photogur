class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:id])
    if @user.save
      redirect_to "/users"
    else
      render :new
    end
  end

end




 # u = User.create :email => 'doug@email.com', password => 'abc123'
