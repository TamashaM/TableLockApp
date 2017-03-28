class CreateDinerHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :diner_histories do |t|
      t.integer :diner_id
      t.integer :delay_count
      t.integer :on_time_count
      t.integer :no_show_count



      t.timestamps
    end
  end
end
