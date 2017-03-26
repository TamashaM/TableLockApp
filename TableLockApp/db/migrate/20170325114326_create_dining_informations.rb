class CreateDiningInformations < ActiveRecord::Migration[5.0]
  def change
    create_table :dining_informations do |t|
      t.integer :restaurant_id
      t.string :dining_style
      t.string :phone_number
      t.integer :cuisines
      t.string :website
      t.string :add_info
      t.string :dress_code


      t.timestamps
    end
  end
end
