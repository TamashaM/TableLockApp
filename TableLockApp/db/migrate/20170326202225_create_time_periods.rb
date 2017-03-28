class CreateTimePeriods < ActiveRecord::Migration[5.0]
  def change
    create_table :time_periods do |t|
      t.integer :restaurant_id
      t.integer :week_day
      t.time :start_time
      t.time :end_time
      t.timestamps
    end
  end
end
