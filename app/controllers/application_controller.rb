class ApplicationController < ActionController::Base

  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def require_login
    unless current_user
      flash[:alert] = 'Você precisa estar logado para acessar esta página.'
      redirect_to login_path
    end
  end
end
