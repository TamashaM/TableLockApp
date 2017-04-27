class RestaurantRequest < ApplicationRecord
  phony_normalize :telephone, default_country_code: 'SL'



  # Creates method normalized_fax_number that returns the normalized version of fax_number
  phony_normalized_method :fax_number
  belongs_to :restaurant
  validates :first_name,:last_name,:position,:restaurant_name, :telephone, :city,:province,:add_line1, presence: true

  validates :telephone, phony_plausible: true


end
