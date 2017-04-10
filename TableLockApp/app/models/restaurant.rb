class Restaurant < ApplicationRecord
  has_one :restaurant_request
  belongs_to :user
  has_one :dining_information
  has_many :offers
  has_many :time_periods
  has_many :favourites
  has_many :time_slots
  validates :first_name,:last_name,:position,:restaurant_name, :telephone,:city,:province,:add_line1,:add_line2, presence: true
end
