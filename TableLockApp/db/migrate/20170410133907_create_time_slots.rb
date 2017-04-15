class CreateTimeSlots < ActiveRecord::Migration[5.0]
  def change
    create_table :time_slots do |t|
      t.integer :restaurant_id
      t.date :date
      t.time :time
      #changed reservations to reservation_count and change the db by hand
      t.integer :reservation_count
      t.integer :waiting_list_id
      t.timestamps

    end
  end
end
