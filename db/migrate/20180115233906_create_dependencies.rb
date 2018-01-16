class CreateDependencies < ActiveRecord::Migration
  def change
    create_table :dependencies do |t|
    	t.references :tests, :pos, :integer
    	t.references :tests, :pre, :integer
    end
  end
end
