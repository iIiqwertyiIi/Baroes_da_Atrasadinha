# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :logged, except: %i[new create]
  def new
    @user =  User.new
  end

  def index
    @users = User.all
  end

  def edit
    @user = current_user
  end

  def show
    @user = current_user
  end

  def create
    @user = User.new(user_args)
    if @user.save
      redirect_to root_url, notice: 'Conta criada com sucesso'
    else
      render :new
    end
  end

  def update
    imagem = params[:user][:photo]
    image_change(current_user) unless imagem.nil?
    current_user.update!(user_args)
    flash[:notice] = 'Usuário editado com sucesso'
    redirect_to perfil_user_path
  rescue StandardError => e
    flash[:notice] = e
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
      user.photo.purge if user.photo.attached?
      user.photo.attach(imagem)
    end
  end
end
