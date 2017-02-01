class CreateRastreamentos < ActiveRecord::Migration
  def change
    create_table :rastreamentos do |t|
      t.datetime :time
      t.references :pessoa, index: true, foreign_key: true
      t.references :issue, index: true, foreign_key: true
      t.references :status, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
