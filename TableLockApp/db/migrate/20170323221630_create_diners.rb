class CreateDiners < ActiveRecord::Migration[5.0]
  def change
    create_table :diners do |t|

      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :telephone
      t.date :dob
      t.string :telephone
      t.string :add_line1
      t.string :add_line2
      t.string :city
      t.string :province
      t.string :postal_code

      t.timestamps
    end
  end
end
