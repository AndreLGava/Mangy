class AddAvatarToPerson < ActiveRecord::Migration
  def up
    add_attachment :people, :avatar
  end

  def down
    remove_attachment :people, :avatar
  end
end