class CreateOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :offers do |t|
      t.integer :restaurant_id
      t.string :name
      t.string :description

      t.date :start_date
      t.time :start_time
      t.date :end_date
      t.time :end_time
      t.timestamps
    end
  end
end
