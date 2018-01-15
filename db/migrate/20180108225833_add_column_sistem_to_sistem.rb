class AddColumnSistemToSistem < ActiveRecord::Migration
  def change
    add_reference :sistems, :sistem, index: true, foreign_key: true
  end
end
