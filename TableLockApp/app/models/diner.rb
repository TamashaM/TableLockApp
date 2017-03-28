class Diner < ApplicationRecord
  belongs_to :user
  has_one :diner_history
  has_many :favourites
  validates :first_name, presence: true
end
