class AlterDiningInformations < ActiveRecord::Migration[5.0]
  def change
    add_column("dining_informations","capacity_seating",:integer)
    add_column("dining_informations","time_seating",:integer)
  end
end
