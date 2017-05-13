class Offer < ApplicationRecord
  belongs_to :restaurant
  validates :restaurant_id, :name, presence: true
end
