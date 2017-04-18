class TimeSlot < ApplicationRecord
  belongs_to :restaurant
  has_many :reservations
  has_many :waitings
end
