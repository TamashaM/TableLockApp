class Restaurant < ApplicationRecord
  has_many :restaurant_requests
  belongs_to :user
end
