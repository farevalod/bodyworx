class Transact < ActiveRecord::Base
  belongs_to :doctor
  belongs_to :patient
  belongs_to :factura_venta
  attr_accessible :estado
end
