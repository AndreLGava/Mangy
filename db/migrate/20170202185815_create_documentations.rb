class CreateDocumentations < ActiveRecord::Migration
  def change
    create_table :documentations do |t|
      t.text :requisito
      t.text :description
      t.text :pratic
      t.string :part
      t.string :functionality
      t.text :traceable_item
      t.string :category
      t.string :link
      t.string :groups
      t.string :context
      t.text :tag
      t.text :configuration

      t.timestamps null: false
    end
  end
end
