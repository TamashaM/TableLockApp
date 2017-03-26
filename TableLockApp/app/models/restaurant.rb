class Restaurant < ApplicationRecord
  has_one :restaurant_request
  belongs_to :user
  has_one :dining_information
  has_many :offers
end
