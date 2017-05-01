class AddAvatarColumnsToDiners < ActiveRecord::Migration[5.0]
  def up
    add_attachment :diners, :avatar
  end

  def down
    remove_attachment :diners, :avatar
  end
end
