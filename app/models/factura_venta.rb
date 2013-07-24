class FacturaVenta < ActiveRecord::Base
  has_many :inventories
  attr_accessible :factura_id
end
