class CreateMealTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :meal_types do |t|
      t.integer :restaurant_id
      t.string :title
      t.float :price
      t.time :start_time
      t.time :end_time
      t.timestamps
    end
  end
end
