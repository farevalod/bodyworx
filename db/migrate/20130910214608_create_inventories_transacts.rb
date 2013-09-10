class CreateInventoriesTransacts < ActiveRecord::Migration
  def up
    create_table :inventories_transacts do |t|
      t.references :inventory
      t.references :transact
    end
  end

  def down
  end
end
