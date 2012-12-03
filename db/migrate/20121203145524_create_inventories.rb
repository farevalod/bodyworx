class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.string :ref
      t.string :lot
      t.string :sn
      t.references :factura

      t.timestamps
    end
    add_index :inventories, :factura_id
  end
end
