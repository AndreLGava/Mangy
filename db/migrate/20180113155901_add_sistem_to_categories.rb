class AddSistemToCategories < ActiveRecord::Migration
  def change
  	add_reference :categories, :sistem, index: true, foreign_key: true
  end
end
