class AddNumberToFactura < ActiveRecord::Migration
  def change
    add_column :facturas, :number, :integer
  end
end
