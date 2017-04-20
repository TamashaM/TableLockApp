class MealType < ApplicationRecord
  belongs_to :restaurant
  has_many :reservation
end
