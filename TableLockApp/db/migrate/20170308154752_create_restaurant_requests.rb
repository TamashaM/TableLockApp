class CreateRestaurantRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurant_requests do |t|
      t.string :first_name
      t.string :last_name
      t.integer :position
      t.string :restaurant_name
      t.string :telephone
      t.string :city
      t.string :province
      t.integer :status
      t.timestamps
    end
  end
end
