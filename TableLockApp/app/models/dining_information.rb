class DiningInformation < ApplicationRecord
  belongs_to :restaurant
  phony_normalize :phone_number, default_country_code: 'SL'
  validates :capacity_seating,:time_seating, presence: true
  validates :phone_number, phony_plausible: true
end
