class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :link
      t.boolean :done, default: false
      t.boolean :available_for_test, default: false
      t.boolean :real_problem, default: true
      t.references :version_test, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
