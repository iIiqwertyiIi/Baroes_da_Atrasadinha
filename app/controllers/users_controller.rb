class UsersController < ApplicationController
  def new
    @user =  User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:email, :password, :username))
    if @user.save
    else
      render :new
    end
  end
end