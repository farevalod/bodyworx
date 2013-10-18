class Transact < ActiveRecord::Base
  around_update :handle_invs
  def handle_invs 
    old_inv = self.inventories.select{|x| x.id}
    t = Transact.new(doctor_id: self.doctor_id, patient_id: self.patient_id, estado: 2)
    yield
    new_inv = self.inventories.select{|x| x.id}
    Inventory.where("id IN (?)",(old_inv - new_inv)).each do |i|
      t.inventories << i
    end
    t.save
  end
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
  def rescatar_pendientes
    
  end
end
