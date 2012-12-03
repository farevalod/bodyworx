class AddTransactToFacturaVenta < ActiveRecord::Migration
  def change
    add_column :factura_venta, :transact_id, :integer
  end
end
