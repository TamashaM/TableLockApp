class AddAvatarColumnsToRestaurants < ActiveRecord::Migration[5.0]
  def up
    add_attachment :restaurants, :avatar
  end

  def down
    remove_attachment :restaurants, :avatar
  end
end
