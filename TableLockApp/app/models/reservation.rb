class Reservation < ApplicationRecord
  belongs_to :restaurant
  belongs_to :diner
  belongs_to :time_slot

end
