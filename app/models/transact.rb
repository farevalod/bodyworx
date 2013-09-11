class Transact < ActiveRecord::Base
  has_many :inventories_transacts, inverse_of: :inventory
  has_many :inventories, :through => :inventories_transacts
  belongs_to :doctor
  belongs_to :patient
  belongs_to :factura_venta
  accepts_nested_attributes_for :inventories_transacts
  accepts_nested_attributes_for :inventories
  attr_accessible :doctor_id, :patient_id, :factura_venta_id, :estado, :inventories_attributes, :inventories_transacts_attributes
  def estado_s
    arr = ["Pendiente", "Vendida", "Devuelta", "Perdida"]
    arr[estado]
  end
end
