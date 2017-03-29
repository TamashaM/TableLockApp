class TimePeriod < ApplicationRecord
  belongs_to :restaurant
  validates :start_time,:end_time, presence: true
end
