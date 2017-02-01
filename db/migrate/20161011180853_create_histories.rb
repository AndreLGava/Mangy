class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.string :url
      t.references :sprint, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
      t.string :description

      t.timestamps null: false
    end
  end
end
