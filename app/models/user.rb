# frozen_string_literal: true

class User < ApplicationRecord
  authenticates_with_sorcery!

  validates_length_of :password, minimum: 3, message: 'Senha deve ter pelo menos 3 caracteres.', if: :crypted_password
  validates_confirmation_of :password, message: 'Deve corresponder a confirmação.', if: :crypted_password
  validates :email, uniqueness: true
  has_one_attached :photo
  has_many :reviews
  has_many :movies, through: :reviews
  has_many :watchlists
  has_many :movies, through: :watchlists
end
