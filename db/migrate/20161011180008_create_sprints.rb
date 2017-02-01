class CreateSprints < ActiveRecord::Migration
  def change
    create_table :sprints do |t|
      t.datetime :start
      t.datetime :done
      t.string :meta

      t.timestamps null: false
    end
  end
end
