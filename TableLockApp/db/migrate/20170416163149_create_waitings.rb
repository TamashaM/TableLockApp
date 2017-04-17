class CreateWaitings < ActiveRecord::Migration[5.0]
  def change
    create_table :waitings do |t|
      t.integer :time_slot_id
      t.integer :diner_id
      t.timestamps
    end
  end
end
