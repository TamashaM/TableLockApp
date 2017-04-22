class User < ApplicationRecord

  has_secure_password
  #bcrypt
  has_one :restaurant
  has_one :diner
  has_one :admin
  has_many :notifications
  validates :email,:password_digest, presence: true
  validates :email, uniqueness: true



end
