class AlterTableTest < ActiveRecord::Migration
  change_column :tests, :status, :integer 
end
