class FacturaVenta < ActiveRecord::Base
  has_many :inventories
  has_many :transacts
  attr_accessible :factura_id, :monto, :num
  accepts_nested_attributes_for :transacts

  def name
	  return "Factura #"+num.to_s
  end
end
