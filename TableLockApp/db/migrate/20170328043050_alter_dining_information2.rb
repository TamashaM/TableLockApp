class AlterDiningInformation2 < ActiveRecord::Migration[5.0]
  def change
    remove_column("dining_informations","cuisines")
    add_column("dining_informations","cuisines",:string)

  end
end
