class CreateDiners < ActiveRecord::Migration[5.0]
  def change
    create_table :diners do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :telephone
      t.timestamps
    end
  end
end