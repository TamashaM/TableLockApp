class Waiting < ApplicationRecord
  belongs_to :time_slot
  belongs_to :diner
end
