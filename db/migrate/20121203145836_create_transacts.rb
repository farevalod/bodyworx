class CreateTransacts < ActiveRecord::Migration
  def change
    create_table :transacts do |t|
      t.references :doctor
      t.references :patient
      t.references :factura_venta
      t.integer :estado

      t.timestamps
    end
    add_index :transacts, :doctor_id
    add_index :transacts, :patient_id
    add_index :transacts, :factura_venta_id
  end
end
