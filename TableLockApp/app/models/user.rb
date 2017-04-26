class User < ApplicationRecord

  has_secure_password
  #bcrypt
  has_one :restaurant
  has_one :diner
  has_one :admin
  has_many :notifications
  validates :email,:password_digest, presence: true
  validates :email, uniqueness: {
      case_sensitive:false,
      message: "email address is already taken"
  }

  validates :email, format:{with:/\A[\w+\-.]+[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i,
  message:"should be a valid email address"}




end
