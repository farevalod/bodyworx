class Inventory < ActiveRecord::Base
  belongs_to :factura
  attr_accessible :lot, :ref, :sn, :factura_id, :factura_venta_id
end
