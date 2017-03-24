class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.integer :position
      t.string :restaurant_name
      t.string :telephone
      t.string :city
      t.string :province
      t.timestamps
    end
  end
end
