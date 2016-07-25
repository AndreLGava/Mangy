class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.string :responsable
      t.string :used_user
      t.string :system
      t.text :observation
      t.text :impediment
      t.date :start
      t.date :finish

      t.timestamps null: false
    end
  end
end
