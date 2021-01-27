class ApplicationController < ActionController::Base
  def homepage; end

  def admin_authority
    if current_user.nil?
      flash[:notice] = "Por favor, Crie uma conta ou Entre para acessar a pagina"
      redirect_to signup_path
    elsif current_user.admin? == false
      flash[:warning] = "Apenas Ademiro"
      redirect_to root_path
      end
  end

end

include Pagy::Backend
