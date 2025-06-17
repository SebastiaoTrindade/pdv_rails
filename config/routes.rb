Rails.application.routes.draw do
  # Root Section
  root 'sessions#new'

  # Sessions - Autentication
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # Cadastro Users
  get 'cadastro', to: 'users#new', as: 'new_user'
  post 'usuarios', to: 'users#create', as: 'users'
 
  
end
