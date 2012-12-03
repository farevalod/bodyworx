class Inventory < ActiveRecord::Base
  belongs_to :factura
  attr_accessible :lot, :ref, :sn
end
