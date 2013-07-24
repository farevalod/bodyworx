class Transact < ActiveRecord::Base
  belongs_to :doctor
  belongs_to :patient
  belongs_to :factura_venta
  attr_accessible :doctor_id, :patient_id, :factura_venta_id, :estado
end
