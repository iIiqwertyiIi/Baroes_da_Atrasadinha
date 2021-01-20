class SessionsController < ApplicationController
  def new
  end

  def create
    user = login(params[:email], params[:password], params[:remember_me])
    if user
      redirect_to root_url, :notice => 'Logado com sucesso'
    else
      flash.now.alert = "Email ou senha invalidos"
      render :new
    end
  end

  def destroy
      logout
      redirect_to root_url
    end
end

