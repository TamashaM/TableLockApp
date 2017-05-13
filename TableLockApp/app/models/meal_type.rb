class MealType < ApplicationRecord
  belongs_to :restaurant
  has_many :reservation
  validates :restaurant_id, presence: true

end
