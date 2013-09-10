class Transact < ActiveRecord::Base
  has_and_belongs_to_many :inventories
  belongs_to :doctor
  belongs_to :patient
  belongs_to :factura_venta
  attr_accessible :doctor_id, :patient_id, :factura_venta_id, :estado
  accepts_nested_attributes_for :inventories
  def estado_s
    arr = ["Pendiente", "Vendida", "Devuelta", "Perdida"]
    arr[estado]
  end
end
