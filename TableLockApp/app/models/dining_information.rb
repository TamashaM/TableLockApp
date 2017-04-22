class DiningInformation < ApplicationRecord
  belongs_to :restaurant
  #validates :capacity_seating,:time_seating, presence: true
end
