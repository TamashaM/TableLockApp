class AlterRestaurants < ActiveRecord::Migration[5.0]
  def change
    add_column("restaurants","about",:string,)
    add_column("restaurants","add_line1",:string,)
    add_column("restaurants","add_line2",:string,)
  end
end
