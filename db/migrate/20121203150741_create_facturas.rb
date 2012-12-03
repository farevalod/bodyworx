class CreateFacturas < ActiveRecord::Migration
  def change
    create_table :facturas do |t|

      t.timestamps
    end
  end
end
