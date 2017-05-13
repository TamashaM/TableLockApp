class DinerHistory < ApplicationRecord
  belongs_to :diner
  validates :diner_id, presence: true
end
