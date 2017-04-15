class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.integer :diner_id
      t.integer :restaurant_id
      t.integer :time_slot_id
      t.integer :packs
      t.integer :meal_type_id
      t.integer :payment_status
      t.integer :reservation_status
      t.integer :customer_status
      t.timestamps
    end
  end
end
