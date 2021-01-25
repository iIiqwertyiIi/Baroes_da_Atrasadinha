class UsersController < ApplicationController
  before_action :logged, except: [:new, :create]
  def new
    @user =  User.new
  end

  def edit
    @user = current_user
  end

  def show;
    @user = current_user
  end

  def create
    @user = User.new(user_args)
    if @user.save
      redirect_to root_url, :notice => 'Conta criada com sucesso'
    else
      render :new
    end
  end

  def update
    begin
      current_user.update!(user_args)
      image_change(current_user)
      flash[:notice] = 'Usuário editado com sucesso'
      redirect_to perfil_user_path
    rescue => err
      flash[:notice] = err
    end
  end

  private
  def user_args
    params.require(:user).permit(:username, :password, :email, :password_confirmation)
  end
end