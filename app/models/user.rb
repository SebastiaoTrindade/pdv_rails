class User < ApplicationRecord
  has_secure_password

  validates :nome, presence: true
  validates :email, presence: true, uniqueness: true
  validates :tipo, presence: true, inclusion: { in: ['administrador', 'funcionario'] }
end
