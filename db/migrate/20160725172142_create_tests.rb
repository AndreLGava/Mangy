class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :part
      t.text :description
      t.integer :row_order
      t.text :settings
      t.string :file
      t.text :expected_result
      t.string :status

      t.timestamps null: false
    end
  end
end
