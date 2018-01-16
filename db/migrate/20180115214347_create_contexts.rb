class CreateContexts < ActiveRecord::Migration
  def change
    create_table :contexts do |t|
      t.references :tests, :destiny_id, :integer
      t.references :tests, :origin_id, :integer
    end
  end
end
