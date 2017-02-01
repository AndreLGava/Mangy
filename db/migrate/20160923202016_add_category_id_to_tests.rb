class AddCategoryIdToTests < ActiveRecord::Migration
  def change
    add_reference :tests, :category, index: true, foreign_key: true
  end
end
