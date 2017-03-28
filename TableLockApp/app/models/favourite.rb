class Favourite < ApplicationRecord
  belongs_to :diner
  belongs_to :restaurant
end
