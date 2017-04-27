class Restaurant < ApplicationRecord
  phony_normalize :telephone, default_country_code: 'SL'


  has_one :restaurant_request
  belongs_to :user
  has_one :dining_information
  has_many :offers
  has_many :time_periods
  has_many :favourites
  has_many :time_slots
  has_many :reservations
  has_many :holidays
  has_many :meal_types
  validates :first_name,:last_name,:position,:restaurant_name, :telephone,:city,:province,:add_line1, presence: true


  validates :telephone, phony_plausible: true
end
