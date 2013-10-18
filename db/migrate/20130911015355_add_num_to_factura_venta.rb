class AddNumToFacturaVenta < ActiveRecord::Migration
  def change
    add_column :factura_venta, :num, :integer
  end
end
