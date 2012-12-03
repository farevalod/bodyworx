class CreateCatalogs < ActiveRecord::Migration
  def change
    create_table :catalogs do |t|
      t.string :ref
      t.string :matrix
      t.float :base
      t.float :proy
      t.integer :vol

      t.timestamps
    end
  end
end
