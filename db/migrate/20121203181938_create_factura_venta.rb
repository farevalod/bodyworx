class CreateFacturaVenta < ActiveRecord::Migration
  def change
    create_table :factura_venta do |t|

      t.timestamps
    end
  end
end
