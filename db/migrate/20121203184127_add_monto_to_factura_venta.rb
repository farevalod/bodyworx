class AddMontoToFacturaVenta < ActiveRecord::Migration
  def change
    add_column :factura_venta, :monto, :integer
  end
end
