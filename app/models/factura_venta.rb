class FacturaVenta < ActiveRecord::Base
  has_many :inventories
  has_many :transacts
  attr_accessible :factura_id, :monto
  accepts_nested_attributes_for :transacts
end
