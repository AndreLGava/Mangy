class CreateTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|
      t.string :who
      t.text :said

      t.timestamps null: false
    end
  end
end
