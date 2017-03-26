class AlterRestaurantRequests2 < ActiveRecord::Migration[5.0]
  def change
    add_column("restaurant_requests","add_line1",:string,)
    add_column("restaurant_requests","add_line2",:string,)
  end
end
