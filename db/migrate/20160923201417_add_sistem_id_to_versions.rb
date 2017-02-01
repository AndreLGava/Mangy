class AddSistemIdToVersions < ActiveRecord::Migration
  def change
    add_reference :versions, :sistem, index: true, foreign_key: true
  end
end
