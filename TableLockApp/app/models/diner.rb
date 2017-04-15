class Diner < ApplicationRecord
  belongs_to :user
  has_one :diner_history
  has_many :favourites
  has_many :reservations
  validates :first_name,:last_name,:telephone, presence: true

end
