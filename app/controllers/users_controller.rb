class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Usuário #{@user.nome} cadastrado com sucesso!"
    else
      flash.now[:alert] = 'Erro ao cadastrar usuário.'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:nome, :email, :password, :password_confirmation, :tipo)
  end 
end
