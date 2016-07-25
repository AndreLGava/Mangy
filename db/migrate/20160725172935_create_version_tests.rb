class CreateVersionTests < ActiveRecord::Migration
  def change
    create_table :version_tests do |t|
      t.text :obtained_result
      t.text :impact
      t.boolean :check
      t.references :version, index: true, foreign_key: true
      t.references :test, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
