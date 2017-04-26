class RestaurantRequest < ApplicationRecord
  belongs_to :restaurant
  validates :first_name,:last_name,:position,:restaurant_name, :telephone,:city,:province,:add_line1,:add_line2, presence: true

end
