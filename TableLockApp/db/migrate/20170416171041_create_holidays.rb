class CreateHolidays < ActiveRecord::Migration[5.0]
  def change
    create_table :holidays do |t|
      t.integer :restaurant_id
      t.date :date
      t.timestamps
    end
  end
end
