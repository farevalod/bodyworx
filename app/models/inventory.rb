class Inventory < ActiveRecord::Base
  belongs_to :factura
  attr_accessible :lot, :ref, :sn, :factura_id 
  has_many :inventories_transacts, inverse_of: :transact
  has_many :transacts, :through => :inventories_transacts
end
