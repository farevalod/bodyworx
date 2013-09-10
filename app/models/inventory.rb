class Inventory < ActiveRecord::Base
  belongs_to :factura
  attr_accessible :lot, :ref, :sn, :factura_id 
  has_and_belongs_to_many :transacts
end
