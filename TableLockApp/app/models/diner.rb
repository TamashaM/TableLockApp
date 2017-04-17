class Diner < ApplicationRecord
  belongs_to :user
  has_one :diner_history
  has_many :favourites
  has_many :reservations
  has_many :waitings
  validates :first_name,:last_name,:telephone, presence: true

end
