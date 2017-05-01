class AddAvatarColumnsToAdmins < ActiveRecord::Migration[5.0]
  def up
    add_attachment :admins, :avatar
  end

  def down
    remove_attachment :admins, :avatar
  end
end
