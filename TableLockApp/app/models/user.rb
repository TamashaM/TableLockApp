class User < ApplicationRecord

  has_secure_password
  #bcrypt
  has_one :restaurant
  has_one :diner
  validates :email,:password_digest, presence: true
  validates :email, uniqueness: true



end
