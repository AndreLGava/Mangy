class CreateTecnologies < ActiveRecord::Migration
  def change
    create_table :tecnologies do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
