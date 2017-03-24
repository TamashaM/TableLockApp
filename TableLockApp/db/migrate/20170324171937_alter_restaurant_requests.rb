class AlterRestaurantRequests < ActiveRecord::Migration[5.0]
  def change
    add_column("restaurant_requests","restaurant_id",:integer,)
    remove_column("restaurant_requests","user_id")
  end
end
