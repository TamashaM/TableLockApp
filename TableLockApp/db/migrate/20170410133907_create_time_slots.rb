class CreateTimeSlots < ActiveRecord::Migration[5.0]
  def change
    create_table :time_slots do |t|
      t.integer :restaurant_id
      t.date :date
      t.time :time
      t.integer :reservations
      t.integer :waiting_list_id
      t.timestamps

    end
  end
end
