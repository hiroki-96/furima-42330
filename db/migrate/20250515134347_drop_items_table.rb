class DropItemsTable < ActiveRecord::Migration[7.1]
  def change
    drop_table :items
  end
end