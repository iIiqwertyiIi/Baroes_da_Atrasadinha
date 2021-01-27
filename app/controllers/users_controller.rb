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
      imagem = params[:user][:photo]
      unless imagem.nil?
        image_change(current_user)
        redirect_to perfil_user_path
        end
        current_user.update!({
          biography: params[:user]['biography']
        })
        flash[:notice] = 'Usuário editado com sucesso'
        redirect_to perfil_user_path
    rescue => err
      flash[:notice] = err
    end
  end

  private
  def bio_args
    params.require(:user).permit(:biography)
  end

  def user_args
    params.require(:user).permit(:username, :password, :email, :password_confirmation, :biography)
  end

  def image_change(user)
    imagem = params[:user][:photo]
    unless imagem.nil?
      if user.photo.attached?
        user.photo.purge
      end
      user.photo.attach(imagem)
    end
  end
end