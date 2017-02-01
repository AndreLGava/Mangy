class CategoriesAndSistems < ActiveRecord::Migration
  def change
  	create_table :categories_sistems do |t|
      t.references :category, :sistem
    end
  end
end
