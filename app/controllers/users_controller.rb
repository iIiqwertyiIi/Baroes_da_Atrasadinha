class UsersController < ApplicationController
  def new
    @user =  User.new
  end

  def create
    @user = User.new(user_args)
    if @user.save
    else
      render :new
    end
  end
  private
  def user_args
    params.require(:user).permit(:username, :password, :email, :password_confirmation)
  end
end