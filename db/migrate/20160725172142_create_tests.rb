class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.text :description
      t.text :settings
      t.string :file
      t.text :expected_result
      t.string :status

      t.timestamps null: false
    end
  end
end
