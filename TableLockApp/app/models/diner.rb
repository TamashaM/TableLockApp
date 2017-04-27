class Diner < ApplicationRecord
  phony_normalize :telephone, default_country_code: 'SL'
  belongs_to :user
  has_one :diner_history
  has_many :favourites
  has_many :reservations
  has_many :waitings
  validates :first_name,:last_name,:telephone, presence: true

  validates :telephone, phony_plausible: true

end
