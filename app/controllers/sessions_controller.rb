class SessionsController < ApplicationController

  before_action :require_login, except: [:new, :create]
  
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to dashboard_path, notice: 'Bem vindo, #{user.nome}!'
    else
      flash.now[:alert] = 'Email ou senha inválidos.'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: 'Logout realizado com sucesso!'
  end
end
