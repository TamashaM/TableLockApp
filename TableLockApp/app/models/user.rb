class User < ApplicationRecord

  has_secure_password
  #bcrypt
  has_one :restaurant
  has_one :diner


end
